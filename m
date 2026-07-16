Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F1AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxaNv/hZRGKYOi5i36ULQEYjxk/Dapx7oPsiXilx6q0=; b=qexkgzl+kd95Us6AjpxDV4iTH8
	qDyVnYfonT/ZU5r4I6yflKvaunftlUHrk1YKq2DQRZaXYfYAXSDGPYZzWcRl+KUWDNotyTiVQB5BS
	9psPy96qVjf6pIiR9Mn19mj0QmX1v8BF4+WWbQMj1rEUOq59f3eb/DsKhSvQ1VcHHASrK7mPZmhcE
	AwOwwjXUxC4CmCGlOGyaL2QI3jqfsBMkgeAtAnUnH/MqjBfgs0DPwcqJF6gEF6LVro/tppbXc8wLo
	t0ClemfPv9NbAOYtNs5rOyo4vw12yC9Vyl1K0toSDWmMZyh+LbgljME6XGj0W9K7dWBp684tExEDq
	DGLQa9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9XT-0000000G6df-1lmJ;
	Thu, 16 Jul 2026 00:01:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9XQ-0000000G6co-4A9v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 00:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784160076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxaNv/hZRGKYOi5i36ULQEYjxk/Dapx7oPsiXilx6q0=;
	b=AMHaGb7SrFxHdZ7XaEX7iC3p5eM9qrMFxxxqbjAC38lHjaa0LMZpYS23cBWfzyCjh1FwaS
	sEWrVJDspisls2W7jf5KCsMOVI0Ji1lI0f94dIe8hUnDYCA7MWKoR5uwjiSrVkkUDA5Sou
	gUw4Xymmt9MP5vQMSsaREtNwdEN9e+8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-ug52T7mmPWekI3orXi99jw-1; Wed, 15 Jul 2026 20:01:14 -0400
X-MC-Unique: ug52T7mmPWekI3orXi99jw-1
X-Mimecast-MFC-AGG-ID: ug52T7mmPWekI3orXi99jw_1784160073
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so39181165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 17:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784160073; x=1784764873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxaNv/hZRGKYOi5i36ULQEYjxk/Dapx7oPsiXilx6q0=;
        b=rSeXkwSTbTBJxgtMhvLo2hveIOLdhCdvGrJw6o5IojkqjYF8F4f+X1O0xK2wWt2fs2
         mlQdPJgtEqf5DxgcSmlcUn/AhV9sxPmos0pB8TtyI8WcNXeg8zUbYRSZq8N3/zxvbOAh
         UUX91tzmjmC5g9bQd1mICVA776Xc2LAlhxHNLp5cYxJk2XYLSBWvOfumtYpC/k+LzZot
         UOkomwaR7lffYI4rnFoJGUvKODIHQz53HrAKYRGLpdc7eYmniGXhijBzZt/XQXUukcG4
         b70qYPJyN9EL6VcNk2s3pr3NfoWEQs5r+F7ulQydJ1AVcNE8yR8xmsbkaj77t/Jc9QlJ
         hPOA==
X-Gm-Message-State: AOJu0YwKSP3XG1zIL3IRYft0+346IxkdGETSoNz9fuVCP4cRM9mbKvz5
	5M4+pXRTIR20K3sK+mnN6enhh5UlYE2r66VLovhQOuOF9uc5s7lzqVEjETgGMQVTBzn1gtdVAHU
	fjn2R9iro4/A1ht9IRoJuuE0/zct10lyLqROa3qemiR0Sy36xRgL8MLnXPRzRI97xZDXvB02Vtv
	Bp
X-Gm-Gg: AfdE7cmTi3ry7oPO1rtA/c513XZoRt1qx4PaRs8o7jblVPceMNTdNicnOx3tD53oY2M
	MbOsdnzGWVO7CeAjs3vR1JMy219JboJxmVAi7OdVvSIqNlExk8d6KpJPg1HSiE5HyYdBUkRsASI
	IP7H+t49wLbC/gEqIkDOJPScSB4coGxsfL/DDFazewU08E9cVmmAux1alMMAe6gS84Dvy9ecTiE
	1/Gon9mXMhhy1Kxp9ddp9JVowdEYsoOlvzGbHOhKfXvWhkSPaormOpXxi3EW6YGDxxpEbg7nGEO
	C1S1bDrKrLnSydkwKF8XiKYou9A6bD0saL0DIM8sr1XeEIWxL1bGb7r+AJ53xZJKUigWFo3hVWJ
	ACDJ+R2dAwuQYcfETSTSP+CRsleX6qBcVILHghubmkrI=
X-Received: by 2002:a05:6300:2290:b0:3c0:9c19:b275 with SMTP id adf61e73a8af0-3c110bd7b12mr21730495637.67.1784160072703;
        Wed, 15 Jul 2026 17:01:12 -0700 (PDT)
X-Received: by 2002:a05:6300:2290:b0:3c0:9c19:b275 with SMTP id adf61e73a8af0-3c110bd7b12mr21730443637.67.1784160072256;
        Wed, 15 Jul 2026 17:01:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fcd26sm4696911eec.5.2026.07.15.17.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 17:01:11 -0700 (PDT)
Message-ID: <5244aa2f-ac2c-421a-bd0e-f9e3f1c5ac52@redhat.com>
Date: Thu, 16 Jul 2026 10:01:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: sysreg: Add BBM_3
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-5-linu.cherian@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260715053408.1950475-5-linu.cherian@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bV34WO4wy7r3z4oNkg-a33Grg_jK4JP3QZFf-iycJlE_1784160073
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_170117_114782_9ADAFE7C 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On 7/15/26 3:34 PM, Linu Cherian wrote:
> Add BBM_3 definition for ID_AA64MMFR2_EL1 register.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   arch/arm64/tools/sysreg | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


