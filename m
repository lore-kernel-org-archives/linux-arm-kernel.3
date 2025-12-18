Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939AD68BE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=; b=EDhcXMdTIBi2HLi5+aRQ5e4EFH
	jBfV+SQ40aeJAsMpUvXrNKvGbKxDn7K63gfdF+hhJXAvKFOi5xSrff46+cHJSMcoDJXV4eb8R6Ff2
	0V6fBcdcetsCHAiFtVy7yRuoVCe2Jw6eidD6dgkg6zhrxVjNY72Hz3aRXLF4A8gqhlBJBxldarpxQ
	ahM8pQqQ0ZI78BM9R27VHVe9jbrU3+FVeIRmLHrNrxca1sYFDtJAmJRnfmXL53qujRqagXSiM8Pzj
	NeYTzFjAKRKDNIJrtcfAb3Oe2nnz7CtGsyNL3NSPcoSqY8ZclOQ0WgjVKaM2948YRugTYQyMEtQXE
	6xMtI5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8KX-00000007x7A-1YGw;
	Thu, 18 Dec 2025 07:21:45 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8KU-00000007x6K-1pjO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 07:21:43 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-65b6b69baf8so68605eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 23:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042501; x=1766647301; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=;
        b=xK6X8A8U0QCbATJ2jtN/HHBP6iBEq5stsaPhuwJf9+Sjosgr5O1cFogiETus1vHahc
         6yw37gLAK8ikNkz7WzYrPh9o7AuB/0mVuzhv2J+JC2pGqJXcRsjv0P/Mws8mbm4Z2YlP
         0szLYDhFZ87bdvv3vyFVFnpyLr4KvxGFTzc+QcM35Q1LxO6YBZ8hQjQYz1qMnxxDbSlK
         crKP3bMLBFnJIh1YD9H1DQgxWVGSHMdwUji1erYG9aZqXFBG/TuQIvjDks1jT3IZ/3wG
         gMMMa5J8Npg5GqmpByOu7wrzIJ4zUb7L5DY26j2AX4EfKvG0InaHCx+Tvia1wmeDHa9e
         I95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042501; x=1766647301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=;
        b=Se8OA32W3ew/KAkYK7+BBslFZxrpFVpPTx4n9NExCvl6Wwp0QvK8dVgQJACdIMkUUs
         NO3jnSy96zW8yVd5Yw5dDMzrnnpDjBAbbmhnSAMFZREQGnXuGG+VX4xuppdVCR5pgssR
         NTaGNoCkBjYVlE3Tj2bpbckUM6E+iNVCSzaPAPXuVNIOwLsNK2TdbtKCQYX+w3REBAE/
         lcKf0KBLjzTZ0aYii7mpCjbfMDWheucn7OOv/DtjiXqSr/DLgUBOFIS7d6/5oAgYWQ+p
         o8/psW2c+1411+gH3vbCPF6hB1PMVQfeRmke26rHxvp47STnZFGF+8r48NmWZKyZmXgj
         R50Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9ge3YOZvI3mWyMF0FKXg/DL9cG0vrjtV/GPO/dH8w1CTRo+7ZBFvMao7yFPPajFwnYxMzI3XZXcfnnO+MT+G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3IKTi93/xlHQfwP0Zb8/LKB6IPSMkQgH4bVAV2lqkHXBocIPB
	bUPXOjOV1en6Yg7FrOgnyBvRKHzcnzz8r7aDtxm/5MEYjL0sDC+Si72udF3cbfc34K0p/EKBwKN
	phQT6RyAG0+hQKr4tT2d1UQhfbQeEF0JxD+GpID0VrA==
X-Gm-Gg: AY/fxX7EXkElR08U1p0Ltha0po8Rm9rk3zw/uxFrdm8O8N6IQzJjwXRXJ+maKJMRQ51
	001cYhDkixAVDI0jL7Q7+z9VYjgvsybzYlVsoKrB+ZUXrBZlvYzHZJoqDdy9TDa7dkq1fjKqnSC
	3s6ZheW/VCblofsn+cN7tkJjdSPnd2tE+R3/ycNnikOS/Iur9+/4VV5Wqg3NV1YWrG+t2U2dQGz
	HKJXOBpiwwN2j1U0RxlaZglLcDequZiE208DfG+gLZE43aOhwV+B/ZckPiObG6UcwhCVMtNj0Ak
	sH81yRtyqEQ3/+eZRMzGSTp0/A==
X-Google-Smtp-Source: AGHT+IHdzsrnh67Z+uk7sg0iAMocZMySikku48EGz5g7L5MG+hq7iSRlseyY2l5vM8LHePwozU/hD6rMNUuAq73AgFc=
X-Received: by 2002:a05:6820:828:b0:65c:f41b:7119 with SMTP id
 006d021491bc7-65cf41b750emr1784992eaf.5.1766042500598; Wed, 17 Dec 2025
 23:21:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 18 Dec 2025 08:21:27 +0100
X-Gm-Features: AQt7F2r_j21Nqcv1IzhOT6jk9UPtvnwA1D3etXiTv5WveGJRYXXMC9qqoGF_Yc4
Message-ID: <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_232142_518976_1B24AE7C 
X-CRM114-Status: GOOD (  26.81  )
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

Hi,

On Mon, Dec 15, 2025 at 3:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> the objective of this series is to make tee driver stop using callbacks
> in struct device_driver. These were superseded by bus methods in 2006
> (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> methods.")) but nobody cared to convert all subsystems accordingly.
>
> Here the tee drivers are converted. The first commit is somewhat
> unrelated, but simplifies the conversion (and the drivers). It
> introduces driver registration helpers that care about setting the bus
> and owner. (The latter is missing in all drivers, so by using these
> helpers the drivers become more correct.)
>
> v1 of this series is available at
> https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@baylibre=
.com
>
> Changes since v1:
>
>  - rebase to v6.19-rc1 (no conflicts)
>  - add tags received so far
>  - fix whitespace issues pointed out by Sumit Garg
>  - fix shutdown callback to shutdown and not remove
>
> As already noted in v1's cover letter, this series should go in during a
> single merge window as there are runtime warnings when the series is
> only applied partially. Sumit Garg suggested to apply the whole series
> via Jens Wiklander's tree.
> If this is done the dependencies in this series are honored, in case the
> plan changes: Patches #4 - #17 depend on the first two.
>
> Note this series is only build tested.
>
> Uwe Kleine-K=C3=B6nig (17):
>   tee: Add some helpers to reduce boilerplate for tee client drivers
>   tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
>   tee: Adapt documentation to cover recent additions
>   hwrng: optee - Make use of module_tee_client_driver()
>   hwrng: optee - Make use of tee bus methods
>   rtc: optee: Migrate to use tee specific driver registration function
>   rtc: optee: Make use of tee bus methods
>   efi: stmm: Make use of module_tee_client_driver()
>   efi: stmm: Make use of tee bus methods
>   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
>   firmware: arm_scmi: Make use of tee bus methods
>   firmware: tee_bnxt: Make use of module_tee_client_driver()
>   firmware: tee_bnxt: Make use of tee bus methods
>   KEYS: trusted: Migrate to use tee specific driver registration
>     function
>   KEYS: trusted: Make use of tee bus methods
>   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
>   tpm/tpm_ftpm_tee: Make use of tee bus methods
>
>  Documentation/driver-api/tee.rst             | 18 +----
>  drivers/char/hw_random/optee-rng.c           | 26 ++----
>  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
>  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
>  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
>  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
>  drivers/rtc/rtc-optee.c                      | 27 ++-----
>  drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++
>  include/linux/tee_drv.h                      | 12 +++
>  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
>  10 files changed, 164 insertions(+), 138 deletions(-)
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.47.3
>

Thank you for the nice cleanup, Uwe.

I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in my
tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.gi=
t/

The branch is based on v6.19-rc1, and I'll try to keep it stable for
others to depend on, if needed. Let's see if we can agree on taking
the remaining patches via that branch.

Cheers,
Jens

