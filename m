Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C9AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCAZJvHt06Ytv/HQyeVqpgjqz/qDucJlbp+EZk2a+fA=; b=s2piMc6uwuowRK8fjli2/rNp6U
	UXEBPeYeU9h5f6LSi2TBTHyR1uC0NACAk48myw1RrK3jLXXk1HYNjTMdin+QpI84i0TRxFoYqdLKs
	LgUMbAHOwWC/PA1dnnzkNT71uwKmWVromrh+LVpLkvi2cZo5oi9lkCsUJoWf+XJmBZTAZ3WLpi15V
	F+MlZH2XxabzQVP64VVTKI/Y5E+axpLp9Vl5BKann8zadxe6hVJ84RdVDp+iNIK4RzaP4Anr9QZAm
	BS7iAznicU83yq7wPfYHK47tLmd4oOH/QRhGKIYCwG3rAiA+CeWkVWIiEVRNvWW1H5vhqrVG0cgO3
	K7NfESzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPV-00000007dW2-387s;
	Thu, 24 Jul 2025 13:55:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uew17-00000007VZA-2fun
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:29:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6448C1A00;
	Thu, 24 Jul 2025 06:29:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C60E3F6A8;
	Thu, 24 Jul 2025 06:29:46 -0700 (PDT)
Date: Thu, 24 Jul 2025 14:29:44 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
Message-ID: <20250724132944.GK3137075@e132581.arm.com>
References: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
 <6fecd7d0-a5a5-4973-94ce-c63a3dff6bc7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fecd7d0-a5a5-4973-94ce-c63a3dff6bc7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_062949_765494_3D01D62B 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 21, 2025 at 04:46:30PM +0530, Anshuman Khandual wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> > index 0e4164707eea..d542df46ea39 100644
> > --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> > +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> > @@ -183,8 +183,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> >  	dev_set_drvdata(dev, drvdata);
> >  
> >  	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> > -	if (!drvdata->base)
> > -		return -ENOMEM;
> > +	if (IS_ERR(drvdata->base))
> > +		return PTR_ERR(drvdata->base);
> >  
> >  	spin_lock_init(&drvdata->spinlock);
> >  
> 
> Do we still have more similar instances in coresight ?

It is a bit shame that I have enabled smatch for static checking but
did not verify this series.

I can confirm that the coresight driver does not have such issue in the
current code base. After merging the CoreSight clock fix series, we
should be able to dismiss all errors reported by smatch in CoreSight
drivers.

A side topic, I observed that smatch does not like the long functions
in drivers/hwtracing/coresight/coresight-etm4x-core.c. So I built a
smatch version with relaxed limits.

---8<---

diff --git a/smatch_implied.c b/smatch_implied.c                        
index 9055d676..7469f1ac 100644                                         
--- a/smatch_implied.c                                                  
+++ b/smatch_implied.c                                                  
@@ -462,13 +462,13 @@ static int going_too_slow(void)                   
                return 1;                                               
        }                                                               
                                                                        
-       if (time_parsing_function() < 60) {                             
+       if (time_parsing_function() < 300) {                            
                implications_off = false;                               
                return 0;                                               
        }                                                               
                                                                        
        if (!__inline_fn && printed != cur_func_sym) {                  
-               sm_perror("turning off implications after 60 seconds"); 
+               sm_perror("turning off implications after 300 seconds");
                printed = cur_func_sym;                                 
        }                                                               
        implications_off = true;                                        
diff --git a/smatch_slist.c b/smatch_slist.c                            
index cc3d73b7..039cdae7 100644                                         
--- a/smatch_slist.c                                                    
+++ b/smatch_slist.c                                                    
@@ -321,7 +321,7 @@ char *alloc_sname(const char *str)                  
 }                                                                      
                                                                        
 static struct symbol *oom_func;                                        
-static int oom_limit = 3000000;  /* Start with a 3GB limit */          
+static int oom_limit = 4000000;  /* Start with a 4GB limit */          
 int out_of_memory(void)                                                
 {                                                                      
        if (oom_func)                                                   
@@ -332,7 +332,7 @@ int out_of_memory(void)                             
         * It works out OK for the kernel and so it should work         
         * for most other projects as well.                             
         */                                                             
-       if (sm_state_counter * sizeof(struct sm_state) >= 100000000)    
+       if (sm_state_counter * sizeof(struct sm_state) >= 500000000)    
                return 1;                                               
                                                                        
        /*                                                              



