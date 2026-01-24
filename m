Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A604BD77898
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=; b=WtsdesmTA22pTeMNwcx8lUg90L
	ONH9tWtD5DGK4N4NNmqgKiL382dTeRe5kCTW84mZ1c5XV08py4eIAP7+ykCtFryjr3UE8GwSHoxKS
	PQgeDYmrOTqareiZBobGoyObMU7qHA19588YWCHpumhKv/MLr/iE3TY7+5eWdENL+oEAh218C40or
	Ml/7hKC/JQAOCoskZz2iwemaf0Tl1YC6drXZSUsheH+nr/it/vm15qMebGOXtv+Wk6ywR8JtWn/Xp
	iy+ed12RkLO99YCFrDLR6xfcbkJBwJ4Fw+yJrSPyHtoCG2nsFp9qReRUhqkVkz2M2YPUg1b49Pxm6
	84iLWVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjROh-00000009c6n-1syD;
	Sat, 24 Jan 2026 00:21:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjROc-00000009c6N-3QoB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 00:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769214057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
	b=Nh1jvGaUjRm0atvydNlFFcW0SGiWwOYFpOdTr4FsomtL9qdYU+lsoKPYZQ/oTEFfdVlIFN
	N+bjUvd+u6NUv4R012H2KaeQ6qtKfPv98GcgZHcSau+9q456oOuIes5Ywj7Z67w+zv8VdE
	jxe3YXmMkcgTLM5xpkflhgGfV4Frk5c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-GbzFgFjzM0qtF2QDCJedmg-1; Fri, 23 Jan 2026 19:20:55 -0500
X-MC-Unique: GbzFgFjzM0qtF2QDCJedmg-1
X-Mimecast-MFC-AGG-ID: GbzFgFjzM0qtF2QDCJedmg_1769214055
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76f2d7744so23237645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 16:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769214055; x=1769818855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
        b=FHyiKksuOxmjJKIE42mKGvE6l4BFazvg79afKTX1aZtqttHoiP1+jljuWNSDHlMvyz
         IM0lcc3rx3MHrqzJz5ING9GjiNON+LHmxG1736I2cnUt6qcKIUVsaTp7SDzQJ9UDfI0l
         uQKLBXsbv/7jjvBdcNHxoTVMRfrbA6DkVYVyziXhShwrl0J9B0mCe6vachw1m6pUphcY
         TR/K4VTqhjBbAVqli6dRGQsSEznMh+IKBzybyaqdnUfyAdHw3vAcuBFK1SXSOr6mlmZm
         UPrY98JFIpjV606ukL7IXe4b79Jc/bmq7F/nx7DwHc/21WeBM8ScN6oAjvH/4jgWjxRO
         hrzA==
X-Forwarded-Encrypted: i=1; AJvYcCXhJpHjyx5v5BWxsoEDBOrfvY8Aj5JH7JUQRZbo/Cr7B5ZMf4yhMRxz1tN/B1C4pUmpWOI6NEtN+AbraOK7O1eC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw86tt0WxPklz8MHwWd0UEO+N9Nf0RMy8/mn1nfmgKY+UyD2LFz
	bdGgkq1iGf+rryD3HGI86d88ZwVPNbdIjvNazurwA6AdOgMIkiBy6ka02ctDtO51uoHc5UVkOnF
	YNSx34poJ8ZH/uuvD4OccnsKbeaCZg/T2aiuqMZzIx6SeVh6t3fORbKclGgFW/U2cZA/fYOtvhz
	8n
X-Gm-Gg: AZuq6aJhFvqJs03bsL1TfF+nIa1xeb55FCEt3z61BJb3pTp9oEQCJ40RhTBbREEkfHw
	W6E8sLKOWq0Afp7yUT7QR4Y1bT0bUqtgrk09jMnV7jOSbcYizxtwHwqxiy93JTSvk4hYCKTS/FW
	o9Wper1bL7w6bxA8aQMbuN1DlJU62XJuD06QEy+tBWGu8tUsVgb9VqKelN/x/3EJS99UZEsxjf4
	wCEVE1J24axK2SzXJFpGE4WARuFpn+UGuO6e5TFylBtQ1mCjVGAr+4XE8JF48UGAp0xXGLpw1we
	KwS0a7T8wuy8+1MB220TbWM25w3QtGW0enAhmlwTnngEI9bWulRcogpce4gPwz/OJG0j2s2b1FB
	R
X-Received: by 2002:a17:902:e54d:b0:2a7:682b:50ac with SMTP id d9443c01a7336-2a7fe625118mr44257505ad.28.1769214054353;
        Fri, 23 Jan 2026 16:20:54 -0800 (PST)
X-Received: by 2002:a17:902:e54d:b0:2a7:682b:50ac with SMTP id d9443c01a7336-2a7fe625118mr44257045ad.28.1769214053812;
        Fri, 23 Jan 2026 16:20:53 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802faf6f9sm29695045ad.71.2026.01.23.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:20:53 -0800 (PST)
Date: Sat, 24 Jan 2026 08:18:46 +0800
From: Coiby Xu <coxu@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-integrity@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <aXQN-ZNhT5olbf6X@Rk>
References: <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk>
 <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
 <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cooFon88yoj3JhIr5rIovylWdH2sUPHEeFtSsCmZF-s_1769214055
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_162058_957155_1842B2E7 
X-CRM114-Status: GOOD (  20.02  )
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

On Wed, Jan 21, 2026 at 05:25:39PM +0100, Ard Biesheuvel wrote:
>On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>>
>> On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>>
>> > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
>> > index 976e75f9b9ba..5dce572192d6 100644
>> > --- a/security/integrity/ima/Kconfig
>> > +++ b/security/integrity/ima/Kconfig
>> > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>> >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
>> >          bool
>> >          depends on IMA_ARCH_POLICY
>> > +       depends on INTEGRITY_SECURE_BOOT
>> >
>> >
>> > Another idea is make a tree-wide arch_get_secureboot i.e. to move
>> > current arch_ima_get_secureboot code to arch-specific secure boot
>> > implementation. By this way, there will no need for a new Kconfig option
>> > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
>> > concern.
>>
>> Originally basing IMA policy on the secure boot mode was an exception.  As long
>> as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
>> you have any issues with replacing arch_ima_get_secureboot() with
>> arch_get_secureboot()?
>
>I don't see an issue with that. If there is a legitimate need to
>determine this even if IMA is not enabled, then this makes sense.

Thanks for the confirmation! Here's the updated patch
https://github.com/coiby/linux/commit/c222c1d08d90ef1ec85ef81ece90afc9efde7937.patch

If there is no objection, I'll send v2.

-- 
Best regards,
Coiby


