Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F948E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmRqWPf6A/v7vancMq2qxbJScL8pAxI2UCO46uhFd0I=; b=Ya85+F42ia9OwJvv+Ci6jBPkUH
	IfmxSH+ZRA59q2Ea/+Y2t4GgwdL8+qj07Iiejd5Cyf8BbtMtHAeVSn3sY9vSh96kbfjj1LQN0Nefu
	BGvJ3WpYoPbaUgNJGSCddFbGt6gNC+MNQsz14zchC0zLxlrD08ihvTXfHezV1gDch0EsvOlVTI7po
	Hse8vIf5Pr2XfKsh25FyW/pl1McC1cnHPDzsVf4imiKwGvTCW4YzYNG212TqkQw+hRnEMFVdEBYJ6
	gU3w6oZ3ZBg3O4tyAJyO/SrOPWXVhF1yeRGrrhHp+crIyJr3+QU/bKWbQbgg39XbF//NCv5lpGbbP
	1pbaC4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvK2-0000000Gtq0-2YDT;
	Wed, 18 Dec 2024 14:46:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvIw-0000000GtgR-0Rt7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734533135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmRqWPf6A/v7vancMq2qxbJScL8pAxI2UCO46uhFd0I=;
	b=ac9FQj31o2ZiDFoG8dGSnEkpvUe0VlIPeUqTExCKXW+cqjbiS5BCdyz4/dWf0J7aKKOdFX
	AtdpqmWacMwNOcdnsKh44/XJlqjlyF/ZKuAzF3p2mOTBsZlBsXUetKD0wwVRnFngEJzcgX
	vI4GwaKvQ6HgwbT7SSTCzZbC64R9L/g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-gJFnrfUpN_OtVzDQ2X7ZbQ-1; Wed, 18 Dec 2024 09:45:32 -0500
X-MC-Unique: gJFnrfUpN_OtVzDQ2X7ZbQ-1
X-Mimecast-MFC-AGG-ID: gJFnrfUpN_OtVzDQ2X7ZbQ
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d931c7fc26so111826686d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533131; x=1735137931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmRqWPf6A/v7vancMq2qxbJScL8pAxI2UCO46uhFd0I=;
        b=I0NA3qhdNxv+DR1Y2w4Cv/iQZ7PMx489GGTOfQMwPQ7bgDlG8WCzPKKywUs+fWZUGS
         UB1QUw3vyGjG1LlWVptnflJ0QQeh2MVME6Cfvjkgikm8YdHmmXWoZK8NbYuqVBKNV7Cx
         dMl/a7G8UL/d60Zwf6T2k7oQ/JmWf/PzeSCQNPtjWrVR3qfK111p+6qwYeOMwxoBmZ1l
         HpjHSv7jTn8k2pJRehXNLyT8j6o3jtwOk8eVw8Lqj9HDeacjjhSMna85OVj4zmrDqnb+
         P+j5jdfzLiK7yFwDpzHEkiEGRZuMA6IPWTMvZNkWOCdGVqu0fCIiXLY5kriWWNzish/A
         EeIA==
X-Forwarded-Encrypted: i=1; AJvYcCXEDfZ089SQvYNyKuwRUJ5xXMOZ5O/lfM1k3ALpO6AsCfG0FAAK/3Hsv9PTY59A9U3BP7G8Nchan+J1FvL5/bMl@lists.infradead.org
X-Gm-Message-State: AOJu0YzeidkvfQI28w58RuYoBpjSwZWodr2BKMoaxktVGGiGKI+MBwji
	WfYJGK+PsxLN+h71TR6IJsB+VGMFQhwKTQBw04gMLjdtPNHAhaSySw/3nE0yavTdYjr/zY35yz9
	Gr81LShrnA6xbsuSOgEc7Z1sbWrX1/8+w+s/VRyvJfWeBVHeyRRDETU1EymXd2mlmGxd0HCS9
X-Gm-Gg: ASbGncvKSzLeTU/tr0Y/AC6785W7ePC5xuD5kkpO3yvqiNR/EbHWdS4OEvs8U+b0qIH
	/XEcxwDFbLnKu6I/BTdGSgZ7CPu0PyYibniQB5J5eOQeHbqyRrwB9itEFjKqvx+JmMOF1KhLNsW
	WMHwfY8INbmkDoJULMQRQVKLsljhNE53FvNj2A3cHIt2Shq67k9fnaKB+ufSrrU2Ze8oU3WKf8B
	VdqSF8SEdeY1KMDHEn4JxGStNxt9ztiv/SRilhZABqlr7reRBbqAGbpqKE6Dx4PpT0oBoscwP6w
	NgsMDGR6tp2nawrgzowd1zo=
X-Received: by 2002:a05:6214:c8b:b0:6d8:a48e:a027 with SMTP id 6a1803df08f44-6dd0918ab11mr56278546d6.2.1734533131237;
        Wed, 18 Dec 2024 06:45:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFWttORJMCyN+iMJ3WRwzS7ARy8gEQ5YZOy4Oer475wIqOW3FCeQiurtncC5G/NEy1cejOHQ==
X-Received: by 2002:a05:6214:c8b:b0:6d8:a48e:a027 with SMTP id 6a1803df08f44-6dd0918ab11mr56278126d6.2.1734533130927;
        Wed, 18 Dec 2024 06:45:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd26e426sm50550396d6.64.2024.12.18.06.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:45:30 -0800 (PST)
Message-ID: <4734d430-1d07-41ab-8679-d1fc39cebdf6@redhat.com>
Date: Wed, 18 Dec 2024 15:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 05/46] arm64/sysreg: Add register fields for
 HDFGRTR2_EL2
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-6-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-6-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eU21JbvR86KQg5V96KghZue0sgiDeG6fVO_9I70Dp9o_1734533131
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_064538_226280_E22C0707 
X-CRM114-Status: GOOD (  12.01  )
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



On 12/10/24 06:52, Anshuman Khandual wrote:
> This adds register fields for HDFGRTR2_EL2 as per the definitions based
> on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/tools/sysreg | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 10b1a0998d99..a56f7384d0db 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2562,6 +2562,35 @@ Field	1	ICIALLU
>  Field	0	ICIALLUIS
>  EndSysreg
>  
> +Sysreg HDFGRTR2_EL2	3	4	3	1	0
> +Res0	63:25
> +Field	24	nPMBMAR_EL1
> +Field	23	nMDSTEPOP_EL1
> +Field	22	nTRBMPAM_EL1
> +Res0	21
> +Field	20	nTRCITECR_EL1
> +Field	19	nPMSDSFR_EL1
> +Field	18	nSPMDEVAFF_EL1
> +Field	17	nSPMID
> +Field	16	nSPMSCR_EL1
> +Field	15	nSPMACCESSR_EL1
> +Field	14	nSPMCR_EL0
> +Field	13	nSPMOVS
> +Field	12	nSPMINTEN
> +Field	11	nSPMCNTEN
> +Field	10	nSPMSELR_EL0
> +Field	9	nSPMEVTYPERn_EL0
> +Field	8	nSPMEVCNTRn_EL0
> +Field	7	nPMSSCR_EL1
> +Field	6	nPMSSDATA
> +Field	5	nMDSELR_EL1
> +Field	4	nPMUACR_EL1
> +Field	3	nPMICFILTR_EL0
> +Field	2	nPMICNTR_EL0
> +Field	1	nPMIAR_EL1
> +Field	0	nPMECR_EL1
> +EndSysreg
> +
>  Sysreg HDFGRTR_EL2	3	4	3	1	4
>  Field	63	PMBIDR_EL1
>  Field	62	nPMSNEVFR_EL1


