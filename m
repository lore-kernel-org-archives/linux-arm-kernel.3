Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CD5CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxAhSsMDGNnMgBD5McDp4/uZmqqHc3OE6kQMHu7kZTE=; b=I6kwIzm1iJjjCSH3nJkIj/9ydc
	ZCUNiBpfINFNzGCvoc1ERSJ7IJ8OM5UYKAz7l7F0OIhKq4HpdcyT5gB8EQbL2CGPR7SmIS64uV4yd
	7FqmwDW2zMLm9LT6hL9ncOfqgJDAqX29zb4kvFvtaFPlrCWnN7OmL/GwMvFW+YwKrjB3cTzOZMTJN
	/jKrFMoxmD2lv2vRCpzomge5kICS0rb7ClfEgO0pgEvcgagPD9MGFelxB6CFx7Unp3+i8lrNjpGUH
	NAE4YwDESd6Y3Oyxap142+aM9fwUQs4s0XlvJ3glRCqwPV2McSQYdzkMoqAVw3iH9VXkN8vt6Mc50
	K/6tMYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCJU-000000059SC-0FzE;
	Mon, 15 Sep 2025 16:44:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCJR-000000059RI-1AZg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:44:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0428b537e5so610255366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757954659; x=1758559459; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fxAhSsMDGNnMgBD5McDp4/uZmqqHc3OE6kQMHu7kZTE=;
        b=if28Fs9qvJxiAKj7Ppfj/Rs8nRAiu6ISVV8EL/39PcO+HRrk14LtfOFJw9Om+QfWRP
         ZNF3fEJYzmswwei9eJQ5c8fuTFUsk//01FXpxn4JDw8fvaH0zYpB4OBb8po7NO2CuZbB
         OAVooSfvLxT0fi/aGzdsKmAG00H5585YhJhfpfnrL75/S+39bzdYEwJOibyzBVy0vRsE
         Bx9dTfBXekwWBv9QsGxtzls5LUs6fOz9nKH8nT6Zpre6dWYI9o1SR9VWwF8ODfQZVbRD
         BhOHLWhqzIda113HmgWm0cTV3AIAYJ7/ZxJJj2qwqn2HoSOUGSLUm2AVig1vTn/Ykc/6
         ZNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954659; x=1758559459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxAhSsMDGNnMgBD5McDp4/uZmqqHc3OE6kQMHu7kZTE=;
        b=unFgRFb4bewEksYr5G0etOoTjRElxqMJiX2fKHDRMqrIo6Z+jChwkToAh5TlvtgFXU
         Uwa4BoCC/o7KOYb56Xpx7XE6lQsK3+SOBKkMyi4Jowif3uNJBGrkAN8ZTIgvu39IP8a1
         nfXkHY2XvP9ytwjufB9PphbyPerft7u3+WB/Rb2ecKMzr0l5kZc1siOAVwi+ns1ka+zp
         1whyBuaf+CUCmgUMMe9X4VEY42kldIbJwrspsjX3vuoAw2kIj0VM4QS1QjgzBfYCIpfw
         PQKJlRkiHxNntEWNAVV4v81pMR1o/4Dy21gw5S0QZeeLg1Z1127fjO8oX3yjLO4i+QBh
         ylCQ==
X-Forwarded-Encrypted: i=1; AJvYcCULqKpOHMQmK4dbBZK+M/hOIoLK7JphG2f4YSHsfZwAxjSH5Aigr0emI5TfOHksRGpaHS4GLB7qClRZ0UUwMe9o@lists.infradead.org
X-Gm-Message-State: AOJu0YwSeTeOZj4G8FQ8IjmGfzMgRTM3V4ztOP/RA4gSKkG+TBRqA4vI
	L5dJfkx91GazrQyr8Crjt+oygcG6FS1LfF50WibjSuP67KXQldWAXh/OhqnXx0b+N2rwq7n9mV4
	MeOJ1eDbXHqD7FCAB8eOnYeJO3sUVCkLb8cKYIcnhEw==
X-Gm-Gg: ASbGncvD7dN0MX9b4aO+dPebk5sIf2SRhr0kgjXfjA3WJbpj4+60JV18NNr+UjerXeP
	S0D7u5f7zXEk9vZWXvOwzz92yYLcoFcqHqMwbBwmKmUN63w2SsrgN++FeacUyiqctBtY+hPjTxc
	/GhN7ulbWwSxrX+AT7lBW3WMzsfSCHp0uy6Mc11wKWAArVgfGhOhNSpaGg2cV7wKUQAF7homPn+
	4NxiiKvuAQrGH+//Ls88bZkOWuw0xrVpBi72OpJJT/MLtl03xJlrPYdL1z27XY8w2RNfIay6OJa
	cT4E/DbnQRfPdjZahhnAAD7v0xPZqrhEBHpzNL+RVzTf+u1jDQ==
X-Google-Smtp-Source: AGHT+IGf97ggS/MfiEI88/iSLTqU3Qf0DD2i0f3tt8LPvU4vPPl8/glKU6zOH4FCiUjaVG28MlFFNsrhziUP+FCI8y8=
X-Received: by 2002:a17:907:60d0:b0:b04:48c5:340 with SMTP id
 a640c23a62f3a-b07c354e86bmr1171558466b.9.1757954659264; Mon, 15 Sep 2025
 09:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com> <cc53b15e-f0a4-413d-95cb-174996344d64@foss.st.com>
In-Reply-To: <cc53b15e-f0a4-413d-95cb-174996344d64@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 15 Sep 2025 10:44:08 -0600
X-Gm-Features: AS18NWCkJjz9GpcWFh1g-R-tsFUtCptD3QVQYJIYkkqkmvYcRqIFsZ3xDtRRAdE
Message-ID: <CANLsYkyLBSbb=LUs9TOPx=cXXon5a_SS1DXmAve_5_7EwwD09g@mail.gmail.com>
Subject: Re: [PATCH v19 0/6] Introduction of a remoteproc tee to load signed firmware
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, sumit.garg@kernel.org, 
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_094421_350579_B44C56A5 
X-CRM114-Status: GOOD (  27.88  )
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

On Fri, 12 Sept 2025 at 10:04, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello BJorn, Mathieu,
>
> Do you think, you could find time to review this series before the
> next merge window.
>
> Regarding the discussion between Harshal and Sumit, I did not notice any
> comments requesting immediate updates; the conversation focused more
> on potential future extensions for FF-A.
>

I would like to get an RB from Sumit and Harshal before moving forward
with this patchset.


> Thanks and Regards,
> Arnaud.
>
> On 6/25/25 11:40, Arnaud Pouliquen wrote:
> > Main updates from version V18[2]:
> > - rework documentation for the release_fw ops
> > - rework function documentation in remoteproc_tee.c
> > - replace spinlock by mutex and generalize usage in remoteproc_tee.c
> >
> >
> > Main updates from version V17[1]:
> > - Fix:  warning: EXPORT_SYMBOL() is used, but #include <linux/export.h>
> >    is missing
> >
> > More details are available in each patch commit message.
> >
> > [1]https://lore.kernel.org/linux-remoteproc/20250613091650.2337411-1-arnaud.pouliquen@foss.st.com/
> > [2]https://lore.kernel.org/linux-remoteproc/20250616075530.4106090-1-arnaud.pouliquen@foss.st.com/
> >
> > Tested-on: commit 19272b37aa4f ("Linux 6.16-rc1")
> >
> > Description of the feature:
> > --------------------------
> > This series proposes the implementation of a remoteproc tee driver to
> > communicate with a TEE trusted application responsible for authenticating
> > and loading the remoteproc firmware image in an Arm secure context.
> >
> > 1) Principle:
> >
> > The remoteproc tee driver provides services to communicate with the OP-TEE
> > trusted application running on the Trusted Execution Context (TEE).
> > The trusted application in TEE manages the remote processor lifecycle:
> >
> > - authenticating and loading firmware images,
> > - isolating and securing the remote processor memories,
> > - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> > - managing the start and stop of the firmware by the TEE.
> >
> > 2) Format of the signed image:
> >
> > Refer to:
> > https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> >
> > 3) OP-TEE trusted application API:
> >
> > Refer to:
> > https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> >
> > 4) OP-TEE signature script
> >
> > Refer to:
> > https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> >
> > Example of usage:
> > sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> >
> >
> > 5) Impact on User space Application
> >
> > No sysfs impact. The user only needs to provide the signed firmware image
> > instead of the ELF image.
> >
> >
> > For more information about the implementation, a presentation is available here
> > (note that the format of the signed image has evolved between the presentation
> > and the integration in OP-TEE).
> >
> > https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> >
> > Arnaud Pouliquen (6):
> >    remoteproc: core: Introduce rproc_pa_to_va helper
> >    remoteproc: Add TEE support
> >    remoteproc: Introduce optional release_fw operation
> >    dt-bindings: remoteproc: Add compatibility for TEE support
> >    remoteproc: stm32: Create sub-functions to request shutdown and
> >      release
> >    remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> >
> >   .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
> >   drivers/remoteproc/Kconfig                    |  10 +
> >   drivers/remoteproc/Makefile                   |   1 +
> >   drivers/remoteproc/remoteproc_core.c          |  52 ++
> >   drivers/remoteproc/remoteproc_internal.h      |   6 +
> >   drivers/remoteproc/remoteproc_tee.c           | 708 ++++++++++++++++++
> >   drivers/remoteproc/stm32_rproc.c              | 139 +++-
> >   include/linux/remoteproc.h                    |   6 +
> >   include/linux/remoteproc_tee.h                |  87 +++
> >   9 files changed, 1023 insertions(+), 44 deletions(-)
> >   create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >   create mode 100644 include/linux/remoteproc_tee.h
> >
> >
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>

