Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A7AC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=; b=mP7LzkJfelrQVsWNHwh29qcphT
	ziT038C9DZY7ja8z1dY6oFvFZNqGZhju0ulYrJf26vcgUFpJNG+wEhC+x4E1lnMSCks66DNSkpnWd
	QjNJqR8i4Fj6EseCUFo/TVDDAEtUm49TSQYLEtmfGoc/OO3JmRnvGobot1ExMEO9tyIj07qSIHZxx
	FWOeYhSEAq4zAVEmwUMoYnKZq4babDMaimYS0AjVPBYRTnxT7bLadH8pVHTQPuNEy42qpOht9ZmcJ
	xAe1Ez4iFqARcedy/4d50RzyPjjm5yFvn5G9oaF0XxsG1W/sOTfvf6MpAJowuoHKbIYM+f9t1SBiU
	JP/W05rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7a9v-0000000EpBZ-22fz;
	Fri, 18 Sep 2026 15:05:51 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7a9s-0000000EpAR-1njA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:05:49 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccafb751so716250a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743945; x=1790348745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=o+K0FTpl9e/Aw/s+Yj077xjgwJPNNEYOpzuy3Vb84lVcKqXtH9rFy/3znGwIibnNxL
         e3GcRDxjjJx4el3us6QMRpzHdOmSNt5srSmenngQq5SL3YE0ohfpiRveU3+iSc6nDd5q
         775wXlFoqTK/UsDnef8itSeYn+XBVZfSbFALsPW64SvSTZXAoIGLCjnXWKl+vH0jXn9f
         SnOOLLWEX3SQYcl2XxQYtHNXE16v1P5PZN4EmXjhm5TixPBqOvZpAnyhf0WvLB40Q7Vl
         BzDpeMk3tYYmsnAZC/PVeQndlTLp9Mjtq5r3FSCa0TSM93UNIThOa3keWJBsJM4OkAR2
         dyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743945; x=1790348745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=vYRqv5y6K3GfmLkoq0Wx069Yvc8poI/ixuXM+ajbGa8vNMEDJcXQnjFrC4sGz/kABs
         Jn15ETdIO3DXP/1wujC7MSFn2kk3YrMvSmUCAogXa7w3qRJSe7/itiXSTFkFzb0XvOJc
         zSiE+MdN+/FKYdjNkiSQS6VcGtPVTrtcXGaShaKIT5LychKX6mX6sarJvOjH5pUc4u30
         rQcmyargJwaWmGS0up95WsnzzifX2WTLE7rHB+8Z5SHBd7aQAjnKbpVqn8Qbeh/bcwBn
         RIiZ8JYkhiD+nmjOeO/n879BfKTs/4CB7QeKdNc6mbGhKZOuRyD8CTkTz1H1ZTpVb4yp
         q0MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIijp//uZCxwur9kT0vePkTtGPo4oWuq0hP22PlCSQULdPUztopys9folz1eKQh2KzrfmfkaHidO0FChsPx6cj@lists.infradead.org
X-Gm-Message-State: AFuF++lQECw5EyKlanG9wJcSIMiCkIOvljpuQQ5o7IFVKl6p/2wMrrPS
	VrCcvufIDfhLgTy4lJBUU+EPVN9SEVvpFMXUK0dAmGUmXGMgDe8/R6m5
X-Gm-Gg: AYBFou3B5FFJZUME7CkTOtyp4tSyEUe0EzEdc76Ry3le4JsfhudKelF5MyNKJ/rbnbA
	AA0TFWbXxCyKF5FIFAbUgdlw3diSoBlrqpllOFwpJjXbSasjBnf0atYIDP98nF3JGPe82gfkHcw
	6boT0QnH+6hex8BiibyfRpbt09zCW+k8rusN6Cq720ZUPNG2GPDcBMVRYtZM9ZxVYU/vAHaw+5h
	pFJiuxWsDhmAvC+n0sl9nXVQNeIO+yORfnf3uzbKesPJbEVu/lBQ65NfnOt0yTRdPqcrGufTUUh
	0+Mx1TVtZ04VZFozZbvyEzSVcUcLynH8WXjNG/AxLcSEa0QlfEPkm+DZADtAzlQMBXhREnA0cQV
	O/W1eSoTxA2hJ+EQNGcsIvfGzZHGNCPci1tCmv7bmdhrvzCOoto2f02Jr1E2jo8XgOpbnxyGs7X
	aeLB0PV6I69eqLg+PsFqZWuxBRQHDeZIQJAbzfuAUNFG35ytFAokCQYIB0b35qbCgXGg32Y96YK
	vmdKEDuSE0S
X-Received: by 2002:a17:90a:1050:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-39e6b0213b1mr199530a91.13.1789743944523;
        Fri, 18 Sep 2026 08:05:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13570529a91.9.2026.09.18.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:05:44 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:05:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Message-ID: <030736c4-ffa4-476e-beba-8dea4359cfba@roeck-us.net>
References: <20260917211344.i.911-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211344.i.911-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_080548_468728_D39B0AB8 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, Sep 17, 2026 at 02:13:45PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "scmi_sensors->info[type]" is
> "const struct scmi_sensor_info **", but the converted allocation type
> would be "const struct scmi_sensor_info ***", as the size was taken from
> "*scmi_sensors->info", which is one level of indirection too many.
> Luckily both element types are pointers of the same size. Take the size
> from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/scmi-hwmon.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter

