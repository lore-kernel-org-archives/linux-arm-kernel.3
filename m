Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82726ECD6FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=; b=FrzbkbE3GYzv8IQ07lWuLkV4E9
	e3gntufCJbU6gXac2DW9bGxvU8Yks8TwBYT1QAu5ldJsLbocsUCKRhjq3LlK0twVC5Z5zf91Y8Z8f
	1LL8n9jjNdGd9cokfJAm5VkO5n0Xqm5zWagGCoWpP2k2IcVr1cXZEsSZtBjFi6TyALyzBavnKEs74
	doc2dLqqnvV3JpP19pzdijHIkPqfWovTI9iPo2cqNGnSuuhvM3c/WN1NLQoK7RLZTFZdu1Do3u6Um
	qLpN/UP8tMU7o+1JuppzrJQI23d83jmaP0f26kxueqKEVLPzSdJNH1S5c8cd1fPVf+6VB9LB71DEC
	hvtJtWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqM5F-00000001IWc-3ze7;
	Thu, 12 Feb 2026 02:05:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqM5B-00000001IVo-3qY1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770861928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=;
	b=ULDh7QcQOGgvZj2wTFEoOjuxG4CSW61nO1C0xeArzSl5Q8k/eAwJOhFcOlv0KuUwdSUn0D
	kdy083qKTD66V88t0Et4GMkxCkB9ukBB1aoR3l0SwJjds3a2gi1vO9mcvGGckNRsF8StIM
	cA6s4WMAxT67AtNYsjwxkzY/MMOG/fA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-wJ6UsP7AP5aq1hDa5seZgg-1; Wed, 11 Feb 2026 21:05:26 -0500
X-MC-Unique: wJ6UsP7AP5aq1hDa5seZgg-1
X-Mimecast-MFC-AGG-ID: wJ6UsP7AP5aq1hDa5seZgg_1770861926
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso26713245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 18:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770861926; x=1771466726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=;
        b=tTCAEmmf5qoXYAklSUiHx6f5XJUOQ2lEkFu62yg5KA4butHJmAQHqDc9PSjodd3RmQ
         96YeuV87K7PjjnT0PysMonDSIA16zCJ3I+agXy6NZLEDaSqv0WP6elcBLWW4PDKdId9j
         UvS2WF6+gWTB3iKjHjbAGOVaZSACbqFXvnA/oeYKRkZJEhAa9f74lTvzm3dGGKITVpNu
         jdhTUYYI9cMJpi9x0rlPyvT7XWZir/9vI6KPK3Oybd4fKR+SuKJMOlkxJyqXueDiPhuN
         q6SQvdAhL0DiXt3pFGsmoONEceH+pz0HkYB1LinXJXAmxNnfb8MuTTbMlvoHkSeXk/yL
         GIXg==
X-Forwarded-Encrypted: i=1; AJvYcCUlCWL2GLkupfIxAZM2WX04IAM2FkA9Ubs7LR4qoV4JL63eIyNnby4m/okKQCNSCFHFI6nGBmKdFD5ktIx1Zw4p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj4b0POC8NkZtI+VyHdu0sbpgQ1TtND7kChpwnabJJtBm1lJRx
	kfsZ77s/WzLruE6Zyd3FD7XiXWhoa+Q0wnExRKIMhmR2bgZV6CeB3JMTjbZsiHHsaAmsYINU+gm
	iPUiVGS3zz38QUtm8V6QTlZNq060dNLRSHm/9VjZ2Odk9/AonW3VlLn/S4myJ56sypaithlWYKh
	HM
X-Gm-Gg: AZuq6aIRSevY/k6ezKvfIBgqdJX9S2mHoMxV5ezky9idPIXNIgeSSo24r5RAcSbwIGp
	cqk0JuDFksugjZvFNO5dQL6Dr1iYZXLAu5OYT5UW9GLbbAc94P0t4LSihUC/U/TLNSm9ZcfM/t2
	aJDX/telnEmPApdKDBpCI8RH4b8tXxZo8zxPDrwXYm3FC+3OBZr+NFMvOleBgXxazvnwhooGqJT
	DZKsangvw4JutdyHvKwCkHVTljlU1DVx4EpLJdz16R+pp7RHGbT+CHHUI5lBXtLDNical6Zq7ap
	VDEp5APtqcWpKq/qrBbdz+PXd0EaSGfU5f3hwP1aGChIL3+uB3pl4jdFOg/LhBKdvYe8t+xFQmk
	hcmugpymKtDV/
X-Received: by 2002:a17:903:1663:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ab3b1583c5mr6716855ad.9.1770861925466;
        Wed, 11 Feb 2026 18:05:25 -0800 (PST)
X-Received: by 2002:a17:903:1663:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ab3b1583c5mr6716465ad.9.1770861924935;
        Wed, 11 Feb 2026 18:05:24 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984c07bsm34405605ad.7.2026.02.11.18.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 18:05:24 -0800 (PST)
Date: Thu, 12 Feb 2026 10:01:58 +0800
From: Coiby Xu <coxu@redhat.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <aY0uGN67vdEP2b_F@Rk>
References: <20260211082401.2407853-1-coxu@redhat.com>
 <20260211082401.2407853-3-coxu@redhat.com>
 <423a3431-1271-4c35-94fe-8ca880679ed9@kernel.org>
MIME-Version: 1.0
In-Reply-To: <423a3431-1271-4c35-94fe-8ca880679ed9@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i2rYrTNmtHHcfB832Ixj1_1SR7yin-rd-48LPoUO31o_1770861926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_180530_096441_AC190159 
X-CRM114-Status: GOOD (  25.64  )
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

On Wed, Feb 11, 2026 at 10:55:17AM +0100, Christophe Leroy (CS GROUP) wrote:
>
>
>Le 11/02/2026 à 09:24, Coiby Xu a écrit :
>>CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>>device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>>To also enable this feature for ARM64 and PowerPC, we only need to add
>
>What do you want to say exactly with 'only' ?

Hi Christophe,

Thanks for raising the question! To clarify, CONFIG_CRASH_DM_CRYPT
provides the framework to address these challenges for LUKS-encrypted
dump target. Since the heavy lifting is handled in the arch-independent
code, we only need to...

If it looks good to you, I'll rephrase it as "To also enable this
feature for ARM64 and PowerPC, the missing piece is to let the kdump
kernel know where to find the dm-crypt keys which are randomly stored in
memory reserved for kdump. I'll introduce a new device tree property
dmcryptkeys ...".

>
>>a device tree property dmcryptkeys [2] as similar to elfcorehdr to pass
>>the memory address of the stored info of dm-crypt keys to the kdump
>>kernel. Since this property is only needed by the kdump kernel, it won't
>>be exposed to user space.
>>
>>[1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250502011246.99238-1-coxu%40redhat.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C0aa5f3b34d694b23b0cc08de6946f66c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639063950684962054%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=8uCc%2Bg6YNojymf8UpZhmJY19vpWXJCC9KIf3qMyQ3dI%3D&reserved=0
>>[2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Fdt-schema%2Fpull%2F181&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C0aa5f3b34d694b23b0cc08de6946f66c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639063950684987003%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=1s5NPHgF1LsXdrDXBhawduFXOqnHPlkbohQHHvolLw4%3D&reserved=0
>>
>>Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>>Cc: Baoquan he <bhe@redhat.com>
>>Cc: Dave Young <dyoung@redhat.com>
>>Cc: Kairui Song <ryncsn@gmail.com>
>>Cc: Pingfan Liu <kernelfans@gmail.com>
>>Cc: Andrew Morton <akpm@linux-foundation.org>
>>Cc: Krzysztof Kozlowski <krzk@kernel.org>
>>Cc: Rob Herring <robh@kernel.org>
>>Cc: Thomas Staudt <tstaudt@de.ibm.com>
>>Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Cc: Will Deacon <will@kernel.org>
>>Signed-off-by: Coiby Xu <coxu@redhat.com>
>>---
>>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>>  4 files changed, 48 insertions(+)
>>
>>diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>index 331646d667b9..2967e4aff807 100644
>>--- a/drivers/of/fdt.c
>>+++ b/drivers/of/fdt.c
>>@@ -866,6 +866,26 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
>>  		 elfcorehdr_addr, elfcorehdr_size);
>>  }
>>+static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
>>+{
>>+	const char *prop_name = "linux,dmcryptkeys";
>>+	const __be32 *prop;
>>+
>>+	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
>>+		return;
>>+
>>+	pr_debug("Looking for dmcryptkeys property... ");
>>+
>>+	prop = of_get_flat_dt_prop(node, prop_name, NULL);
>>+	if (!prop)
>>+		return;
>>+
>>+	dm_crypt_keys_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
>>+
>>+	/* Property only accessible to crash dump kernel */
>>+	fdt_delprop(initial_boot_params, node, prop_name);
>
>Shouldn't this property be deleted regardless of whether kernel is 
>built with CONFIG_CRASH_DM_CRYPT or without ?

This property will be created only if 1) CONFIG_CRASH_DM_CRYPT is
enabled and 2) the dump target is LUKS-encrypted. So there is no need to
delete it if it doesn't exist at all.

>
>>+}
>>+
>>  static unsigned long chosen_node_offset = -FDT_ERR_NOTFOUND;
>>  /*
>>@@ -1097,6 +1117,7 @@ int __init early_init_dt_scan_chosen(char *cmdline)
>>  	early_init_dt_check_for_initrd(node);
>>  	early_init_dt_check_for_elfcorehdr(node);
>>+	early_init_dt_check_for_dmcryptkeys(node);
>>  	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
>>  	if (rng_seed && l > 0) {
>

-- 
Best regards,
Coiby


