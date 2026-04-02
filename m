Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1B6111224F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rWHn8ZLLaNhlcOKvyDiXP9A00oZt/Dbtw9Zn8GCrdY=; b=zc81chw8qbHQXKGfqp+beU/5tf
	ekDei7udU4+9yiO4ynh/1hp1d5W+08UkYV03I+fXc3o+sujoRJ6Y4M3wMljXlOoaKzwO4PRmiUuex
	WShnc+XBhBzak+0lT6TYabRo7++AmSMIQ2zV3z/vlZ7HahtR/SjS6vSfbZT59Qoz+ZZCQJIw9S6vs
	cQqkvGcVhNP+NVYjD2HZ4Sam9pA/kAB59cEilyFzlxg/ps42eFTl+Xjo+9n7Ha3v4mB6E3QhBMB9i
	XN53fRbbKHNFImbCD8e0+Vu3271856cHtkP1xfiKT/clzG9wE1/cZhuHaxYqtpNWOMlQY9mVXnlcf
	1ZEwLlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87Ca-0000000GZXo-29HB;
	Thu, 02 Apr 2026 01:50:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87CQ-0000000GZVp-372G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rWHn8ZLLaNhlcOKvyDiXP9A00oZt/Dbtw9Zn8GCrdY=;
	b=QRYuD1PjaTGfm1RgxgNF3yncJKd7G9fjQMcHzZ3mhWWsRKqCGnOet8KvmN1ugfiUIVcDwn
	mV1IfflBrnGeQTVVMASWKIt5fyTqXqqcjNi0y8gBEKXA5GZngh4TYiGGRp/0HKvewn9Yix
	HfyMc5UbfcIrO/lAVx2mp7SAVz/CLug=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-xfECJabuMAOgnydFAPcTEA-1; Wed, 01 Apr 2026 21:50:18 -0400
X-MC-Unique: xfECJabuMAOgnydFAPcTEA-1
X-Mimecast-MFC-AGG-ID: xfECJabuMAOgnydFAPcTEA_1775094617
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso299087a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 18:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094617; x=1775699417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rWHn8ZLLaNhlcOKvyDiXP9A00oZt/Dbtw9Zn8GCrdY=;
        b=tPr7+9UHA0tuVBCJZJ+WheJ8tiJgaA9Ch03T5ndjGc75wbr/eaD0NPlIcfnj2GgROb
         1x0PI4dIBRZ7oKXr2rylmtF+FAC7wn/IRhSuflSNecKPucbqTztSQVhDyPd5telonEVE
         7PMQMtmghwFLWj7znLU14+J63juCYHMTEqrGbnI2tw1a4Anwcc6awLX8zT4tA32wCwp1
         W9nRGoIeNcnuoDjUyTcg2r0QO8t3uCKPhzfW+8H2Nbxfx4Dc27Ff+KTgBRQ03rD4eDS8
         /j/gFYtxu8zy8j7VYGI7g7zAnj2XXIRzCTQ9NtMiNFQoUUPIs5Dr2/IYZTqUiQIr77ya
         eV+g==
X-Forwarded-Encrypted: i=1; AJvYcCV9jYJM/hCpbCNEfN0/a5v7J7OanUHJBsIcwOoXrxnksWUm1tkkIzyx1hIdqug/nC1OFdqiqXGc5X7/hc164LG8@lists.infradead.org
X-Gm-Message-State: AOJu0YzJzqg3788GFJK8sQMBCbdmWCZTNxIkNo0Q+hqMzV6yKgOKIgwG
	03dt7MnQMVsVSvIxcRSuFLnpXTlqM8l2R2/KKCU3JQ2a3F13oYTrLNfjf0EXX5CbkhzYlnd6Jl9
	L+c35C7ArzG05TbbpOsWz+J+9Hy4BPdWx4z5FS0kggnI5Yc2PihIF8/5l/VZWpp+Q1GyxHz/0aT
	GA
X-Gm-Gg: ATEYQzyU8Xd3KGeetls41/kPxN52zJtVG2jP/y4GwOljpqnNdw/DqwGZt7VFTngwNVY
	r83HdwhnqPwFHkIgBwCOVIHgesePr80tZALpHAd45rvsd48tkK0GGZLoKOrV8o4qQs9h4hvRKD/
	8rkyAbbwoGX1ung2bZeZF23Wqn4kiX+TMGNqe6IyQlg3vHkXaisaBgZvpQsbWulf8HjTOsohTLs
	GTQKxmbBj6DNXQ1pKH/Y1SOiPTL367AicPiRzsuSp0lRio+3o6cFRFdFYdX1+2FyxLUGzAuqBvI
	f5wFtokeiNSALTlyhpJswhEXiazq91i5WG1Iyll51Qz/tSq6J8klVYLrtbHXmF35Qt2wQAe3Fb5
	8Xmq3pxHwfg==
X-Received: by 2002:a17:90a:d406:b0:35d:a843:6b1f with SMTP id 98e67ed59e1d1-35dc6e5f016mr5377530a91.11.1775094616922;
        Wed, 01 Apr 2026 18:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:35d:a843:6b1f with SMTP id 98e67ed59e1d1-35dc6e5f016mr5377491a91.11.1775094616366;
        Wed, 01 Apr 2026 18:50:16 -0700 (PDT)
Received: from localhost ([49.65.225.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe95abc3sm6806610a91.15.2026.04.01.18.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:50:15 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:44:21 +0800
From: Coiby Xu <coxu@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <ac3Hac2RmY2Jahxt@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-4-coxu@redhat.com>
 <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dZoLC3FR6bD3kaHVeIXrad0n-Dsg6sRP21Hj3ROdnp8_1775094617
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_185022_878831_4F307BA3 
X-CRM114-Status: GOOD (  20.71  )
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

On Mon, Mar 30, 2026 at 06:44:15AM -0500, Rob Herring wrote:
>On Wed, Feb 25, 2026 at 12:04 AM Coiby Xu <coxu@redhat.com> wrote:
>>
>> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>> device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>> To also enable this feature for ARM64 and PowerPC, the missing piece is
>> to let the kdump kernel know where to find the dm-crypt keys which are
>> randomly stored in memory reserved for kdump. Introduce a new device
>> tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
>> memory address of the stored info of dm-crypt keys to the kdump kernel.
>> Since this property is only needed by the kdump kernel, it won't be
>> exposed to user space.
>>
>> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>> [2] https://github.com/devicetree-org/dt-schema/pull/181
>>
>> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: Kairui Song <ryncsn@gmail.com>
>> Cc: Pingfan Liu <kernelfans@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Thomas Staudt <tstaudt@de.ibm.com>
>> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>>  4 files changed, 48 insertions(+)
>
>Acked-by: Rob Herring (Arm) <robh@kernel.org>

Hi Rob,

Thanks for acknowledging this device tree patch and also merging the
dt-schema PR!

-- 
Best regards,
Coiby


