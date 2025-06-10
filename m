Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2DC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=; b=KL2UDRmbjoAzExtEsaIqHfp34R
	DFuExzGvWMyqniHwDuhusDI7yT2wHBqBgv1tvtKUVLrnn88oa3CFoTkKerdvneAHCmRjoMKNPPanS
	Y4lF0LStXKqf7Y3iI5b2i9x5QoSYfTwSb6XG1Ril6DQGeG+XVKAGf/03te0VpOHGS3n5gF2gRy3ni
	gAnLxr0FnkMvFtS3UtqmB3N+1dVlhXZ0jQaHQzxEtl2sZw7WeJhFf9BrgYK5R3FSjO5+aCixJvwgW
	cfK/RV1bO3tfqHwTqSlSJHM70dorab78lx+HYGmfP5n30rvFAJEneV0CCY/SJSfR9ktvcoA2nHGAw
	xbhT3ejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lP-00000008Ezp-04Ft;
	Tue, 10 Jun 2025 22:48:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2tv-00000007eW3-11Lj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:36:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad1b94382b8so996518566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749577001; x=1750181801; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=;
        b=tZQpTZXCNOcB5DkbgNoSxEeij3AOU3lJdiv67UHHx5MlAOAx0RuaMI+hb6dJGywnxg
         3KDye27GWMv83e0KTaFCJLKvcFpkaf2eooe7sEvt9BTDeTCluMbQyTk3u+cjVSM+D+wV
         OJ8eDnbRpYYsre+J4zqFrPOzEry9jqdBTIS371m1eXrC4BqNn5+VxWrv8noM2wehXscY
         ZQxrKaqOiqc1LO68DIgKBhey8ddt00IWAUsyJzjca4hvFc03jVDXC1DKyGX0hDHhDusY
         hn1ryJQCOpSudBlihR2H9UyymY9l7wht9/Ru4MnaJnAXzKenAyXxl15PmowLQpawN0l6
         iGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577001; x=1750181801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=;
        b=i9BPWNushd3Nl49mvUYNPQif0R6CA30DUBR5HqgDEwZoH+FSP/BmFyQ1GxlyzKnCuy
         VURolF2K0kO+wkHwUjWPlnDdF21xW3bY8JPPZpk1ZZQoxBtGtdm6FsH5DTVQ7yg0CFdK
         sN8Wj5dOizTIt1Mw5d9zROma0GWNumi4HeocmNOJJgdfpn5TMYc8O9YDRDVOAeD79+or
         ApkJ536037ysbjqZBIzx6DJySYzQ0x1CdkyDtvntjdKtQSHD6ZPRW47kIelpvI+GvDda
         0NiFFsNK/52Tk5M0+8b+OT5yQqoWhr9tZWQcMM3ijq6os7Celxl2FUo3OP0ybdHTwzqk
         tMrA==
X-Forwarded-Encrypted: i=1; AJvYcCXMB/xUsL9cJK5HXX7Wy+4Z8cY9bP3NhLIgVrVnmb1gRdpO5grr7PW8PFCMfg75YsYi2OOFLTNRtHL6/hPL8QYb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+N9fudFGWIjXbmGV2+Z5qyAyfMRwXPrPyxsO2wuo+J9we3W/M
	iyPvStwVKa4aHz6EpkZKilWoqTC7XTYw3ojCRcjmzNXEERkw+W3VAtabaCuZ1U97uE+0ORwTUUE
	1JmtjH3PWJcjnfNJoerVCzk0BxnWle8KyBLrvZgZXXg==
X-Gm-Gg: ASbGncv2a2NQ3mWgJ5Jfyap+CTT+LlWfEkpVXfXaQIBI2/US8s6chQ7SYlZIxeda3Eu
	r/N5rjZTKrgd4l/M1IxIaeCIbFp1RvcBi/KU7fHnvPc0psEk2zwtKsLbDL3YIFoUVQCn9oD3UbF
	l+JriOSDGv2sUsSFbu+7mjW9jhThEt1k80YDXPH/o0mArPS9soJlAV2vCrUhyG2XO6sRGuj8zlj
	4+uKw==
X-Google-Smtp-Source: AGHT+IGnpxZ/kYqFsSq4j6qp84vLjWxNulzEhZc0i1z/5c6tyzkSQMkPM59ws5hVqdCe/nWfEYyFEbx1JOZa0jQG5i8=
X-Received: by 2002:a17:907:948d:b0:ad2:4c38:5a22 with SMTP id
 a640c23a62f3a-ade897f338cmr25361966b.51.1749577001063; Tue, 10 Jun 2025
 10:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
 <aEb8XbhY5dR__GM-@p14s> <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
In-Reply-To: <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Jun 2025 11:36:30 -0600
X-Gm-Features: AX0GCFtaU9fLocUtXIXHBOEkqczV71_1sopLG6zbwgW4ITB5pILObesRDc6IzW8
Message-ID: <CANLsYky=AAnQ3P6J9E9R1=ufVKpGniiVTkfSeaq5J_7E=qN65g@mail.gmail.com>
Subject: Re: [RESEND PATCH v16 0/6] Introduction of a remoteproc tee to load
 signed firmware
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_103643_285573_7A148032 
X-CRM114-Status: GOOD (  37.53  )
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

On Mon, 9 Jun 2025 at 10:33, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 6/9/25 17:23, Mathieu Poirier wrote:
> > On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
> >> Hello Bjorn and Mathieu,
> >>
> >> I am resending this series after waiting for over two months for Bjorn's
> >> feedback, despite a prior reminder.
> >>
> >> Please could you coordinate between yourselves to determine who will continue
> >> reviewing this series? It would be greatly appreciated if the review could
> >> proceed within a more reasonable timeframe.
> >>
> >> Thanks in advance and best regards,
> >> Arnaud
> >>
> >>
> >> Main updates from version V15[1]:
> >> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
> >> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
> >>   load and authenticate the firmware before getting the resource table.
> >> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
> >>   bind/unbind.
> >>
> >
> > Have all pending issues been resolved or is there still questions about some
> > aspects of the design?
> >
>
> No pending issues on my side.
>
> In terms of design, I resend an equivalent of the V13 design incorporating
> Bjorn's comments on V15.
> The pending questions are:
> - is that V13/V16 is aligned with Bjorn's expectations[1].
> - are you also aligned on this design even if you proposed an alternative that
>   implemented in V14 and V15
> Few details on the V13/V16 design:
>
> The main point of discussion is the rproc_tee_parse_fw() implementation.
> In V13, this function loaded the firmware and then parses the resource table.
>
> You proposed an alternative, to add a new rproc->load ops
> in the remoteproc core instead (implemented in V14 and V15).
> Bjorn expressed concerns about this and proposed a solution that, from my
> understanding, is equivalent to the V13 implementation.
>

As far as I can tell, the only difference in this revision is the
loading of the firmware as part of rproc_tee_parse_fw().  I haven't
followed the thread but I am sure Bjorn had a good reason for that and
I am in agreement with this approach.

> Thanks,
> Arnaud
>
>
> [1] https://lkml.org/lkml/2025/3/5/906
>
> >> More details are available in each patch commit message.
> >>
> >> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
> >>
> >> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
> >>
> >> Description of the feature:
> >> --------------------------
> >> This series proposes the implementation of a remoteproc tee driver to
> >> communicate with a TEE trusted application responsible for authenticating
> >> and loading the remoteproc firmware image in an Arm secure context.
> >>
> >> 1) Principle:
> >>
> >> The remoteproc tee driver provides services to communicate with the OP-TEE
> >> trusted application running on the Trusted Execution Context (TEE).
> >> The trusted application in TEE manages the remote processor lifecycle:
> >>
> >> - authenticating and loading firmware images,
> >> - isolating and securing the remote processor memories,
> >> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> >> - managing the start and stop of the firmware by the TEE.
> >>
> >> 2) Format of the signed image:
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> >>
> >> 3) OP-TEE trusted application API:
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> >>
> >> 4) OP-TEE signature script
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> >>
> >> Example of usage:
> >> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> >>
> >>
> >> 5) Impact on User space Application
> >>
> >> No sysfs impact. The user only needs to provide the signed firmware image
> >> instead of the ELF image.
> >>
> >>
> >> For more information about the implementation, a presentation is available here
> >> (note that the format of the signed image has evolved between the presentation
> >> and the integration in OP-TEE).
> >>
> >> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> >>
> >> Arnaud Pouliquen (6):
> >>   remoteproc: core: Introduce rproc_pa_to_va helper
> >>   remoteproc: Add TEE support
> >>   remoteproc: Introduce release_fw optional operation
> >>   dt-bindings: remoteproc: Add compatibility for TEE support
> >>   remoteproc: stm32: Create sub-functions to request shutdown and
> >>     release
> >>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> >>
> >>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
> >>  drivers/remoteproc/Kconfig                    |  10 +
> >>  drivers/remoteproc/Makefile                   |   1 +
> >>  drivers/remoteproc/remoteproc_core.c          |  52 ++
> >>  drivers/remoteproc/remoteproc_internal.h      |   6 +
> >>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
> >>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
> >>  include/linux/remoteproc.h                    |   4 +
> >>  include/linux/remoteproc_tee.h                |  90 +++
> >>  9 files changed, 935 insertions(+), 44 deletions(-)
> >>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >>  create mode 100644 include/linux/remoteproc_tee.h
> >>
> >>
> >> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> >> --
> >> 2.25.1
> >>

