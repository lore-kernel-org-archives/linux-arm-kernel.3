Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12C3D711C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PaWoC2t1nAM4kkkT9YqCtuusWophZKHcy12+KItEp8=; b=aHIuWp1HWtvgxZ/ZwHvQkEtIkJ
	OXR/IV847m4Ve6wlZqxOkdonGBd/J7rNEvS1Q5ya6EOHTsPjKBz9Pc9cUl3A/JdPsBg720wxkWGwE
	hYR4M2SxVHtbEpflVBrIHUYjxfJyniWKzsuLoufNh3FkxunaM01z/LX775C2JmfpOhw4lJECbtETx
	+JfeG4qKAaE/x/Ov3Y27Rb/qoUUwZtB9DByFs693eTV9t+y2s1yeaLJbmDGB1w0skYc42BHRHXVvJ
	IPnt3MCcGeIm/hb+FO4F3mwyB9+JbJIuAgf/CkXbjqe1BdTVWLghLUu87hYAeNaQYCAel0yALKpIA
	r+8voI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnzt-0000000Frg6-23ml;
	Wed, 20 Nov 2024 16:56:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnyw-0000000FrWw-3UG4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:55:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64B5C1480;
	Wed, 20 Nov 2024 08:55:37 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61B813F66E;
	Wed, 20 Nov 2024 08:55:06 -0800 (PST)
Message-ID: <bb01b83a-32cb-4efe-b9d6-06a4cf138b3b@arm.com>
Date: Wed, 20 Nov 2024 16:55:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix arm_cmn_node_to_xp()
To: Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Stephane Eranian <eranian@google.com>, LKML
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20241120164110.266297-1-namhyung@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241120164110.266297-1-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_085510_947287_CA44F544 
X-CRM114-Status: GOOD (  10.76  )
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

On 20/11/2024 4:41 pm, Namhyung Kim wrote:
> The portid_bits and deviceid_bits for XP type nodes are set in the
> arm_cmn_discover() and it's copied to others in arm_cmn_init_dtcs().
> But to get the XP from a node in the arm_cmn_init_dtcs(), it needs
> the {port,device}id_bits.
> 
> This makes arm-cmn PMU failing to count events on my setup.  What we
> need is the number of bits in total which is known by the cmn config.

Hmm, what about just moving the assignment to a point where it actually
makes more sense anyway?

Cheers,
Robin.

----->8-----
diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 397a46410f7c..30506c43776f 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2178,8 +2178,6 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
  			continue;
  
  		xp = arm_cmn_node_to_xp(cmn, dn);
-		dn->portid_bits = xp->portid_bits;
-		dn->deviceid_bits = xp->deviceid_bits;
  		dn->dtc = xp->dtc;
  		dn->dtm = xp->dtm;
  		if (cmn->multi_dtm)
@@ -2420,6 +2418,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
  			}
  
  			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
+			dn->portid_bits = xp->portid_bits;
+			dn->deviceid_bits = xp->deviceid_bits;
  
  			switch (dn->type) {
  			case CMN_TYPE_DTC:

