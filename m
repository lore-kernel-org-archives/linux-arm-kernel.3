Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E95C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=; b=yIXm5Uea4Lc0vhiMXx/Hm6DiCe
	o2/FEiQBO5Qm2fqYfWsKp9nGG9q9Vo5jSdLuORN+uSSEjckSwQXgrrKFiHThans9YYzm9q7wIpv7c
	t83MQzh2RWmCAldM4vRpA9pWD1wkwKClzW4aoU4U0d5g3LpU8czpwJKPNiJh+Pt5e8SjlGUKXkolH
	XIOv11z6LnF1P8Pch4lQx2GYBu71I4FfzyrHz9MdUinCbGsER83aQGt/i0Jq69pEDfp3ZPFL8twup
	tv2SI+kuSs0F0oiEWFfcRSzzKMpQWA4knif71F/QOgj2CfdU3mwYAD+a68xANTzfom9j2xjtCvu+J
	N7EOCB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOesv-00000004aoH-1FxQ;
	Mon, 09 Jun 2025 15:58:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeLB-00000004VmX-0VoJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:23:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-313910f392dso620432a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749482592; x=1750087392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=;
        b=wvL1p/fHPZS+3+tjL5Bb9almHtc8anUk7end4PaSV88mGoVa6TgQgmMVM39SUXGbTG
         RmZWEeZN2EH9Gqxt03042pJNAnzbwU2cvZS5eVeI8NOXOOgcUs/kKuz5mycJrZXs4tbD
         5zheWBGGg6KIWalwyWXrGn08VbubDS6qxl1j6+T+YKrGq915mWpl7PNtLRUV8tvOL/lM
         BiIg37RiB22rICkfNb0LUwtGQUp+VBN8OYh7kFmOCTsv9tufkS1dOHRFR+HGxH+Nmsjc
         luxPkxw5cZdBnchp16WDJ21E5ZtwRg8niVQ7+pCZXtZzDG3UjSpv5+fzz0C0Pb5y//ua
         4XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482592; x=1750087392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=;
        b=BQiawTMMSOZ1qnkrB7JG/vL2oYtMlSu0pofCwFUpta2u1BNVtThifpaczHugEknVgC
         CuEDeLzEBGnOzTLzWx+D4tyhH4AdssJVyrh1MRJypttq/eySz/AxhQfUKIHQbdTBqQGm
         f9XVDWv/O1kR+e1JIrkAUpWohpCNF+sb1zMdTGj3GORUULKOZM93F3WMpbA6qrnpMrL8
         lgy/L4TyrTsBNeLjYOIRlutyx1+0w8OLB59S15x9mvoN5VJ1gkDprEzVJfeGfqXwfScM
         oIkgmRfdGiXfFjoxBHBJohPL0pcZv1QFIu105Ns8gOmnM2QBzZeQDX3+FgdH9lFijg38
         42EA==
X-Forwarded-Encrypted: i=1; AJvYcCUi+bkN18qjCfKnSEcNik1XWDxBxElbNneZDuzq8A9lgsLdKs5lIIL+plVOP/2CnYUvoJHscXCfykUXIfF84KXK@lists.infradead.org
X-Gm-Message-State: AOJu0YwZpPqDSDBgrKS8gpp8KTSAXopNZztPglTSsbVLeCbGHthQa/55
	e95wlxmM+S1LTgSA7oNjXP04SdLPi9bUtl7CwGLmIl2YD+7bXlDWSfQbgBcVT23wp2I=
X-Gm-Gg: ASbGncue2uTmHo0H+TEK7D4BD6gGrOvfqfgDD+19r8iIw0oA7og780Ny1W80w3Hyq6J
	ouZzPSPy64rkcmqwbM2Smpa6imzmNqoHkdVlUvep5kH9InC0ISxXeVwA9F60KX/BU4bIwJ5siTe
	ryC4eiHooo3XxpzQC8lZOhwFEpCrhG015ht/H1LGcxV186a11HGDB/CXE+gxKmAMkt0ViZ++xlS
	K9pSYG/I5Sxs0dd/LdoCViH6j0P65h+JH9sBQnC/ZgQjI/2XWIuJ8DynFD1H4KZF11gBu9IOkWm
	avfarHedB3eHRuKWIle3+8MijS/UdB9jsI12ReAzPB8iAGeNbgVnTqDvI9jswQkwbBZe5MxXadZ
	p
X-Google-Smtp-Source: AGHT+IEHQs24xS7vzskFJPPr8eh6p9W8ZrujNawhU2iz0AreagkiHluW65S1z22AdhoPCthNzNJd4g==
X-Received: by 2002:a17:90b:3891:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-3134740b55cmr21132387a91.17.1749482592330;
        Mon, 09 Jun 2025 08:23:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1329:68ff:ffeb:cd9c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc374asm5791390a91.29.2025.06.09.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:23:11 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:23:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v16 0/6] Introduction of a remoteproc tee to load
 signed firmware
Message-ID: <aEb8XbhY5dR__GM-@p14s>
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082313_166009_4337EBE7 
X-CRM114-Status: GOOD (  29.20  )
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

On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
> Hello Bjorn and Mathieu,
> 
> I am resending this series after waiting for over two months for Bjorn's
> feedback, despite a prior reminder.
> 
> Please could you coordinate between yourselves to determine who will continue
> reviewing this series? It would be greatly appreciated if the review could
> proceed within a more reasonable timeframe.
> 
> Thanks in advance and best regards,
> Arnaud
> 
> 
> Main updates from version V15[1]:
> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
>   load and authenticate the firmware before getting the resource table.
> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
>   bind/unbind.
>

Have all pending issues been resolved or is there still questions about some
aspects of the design?
 
> More details are available in each patch commit message.
> 
> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
> 
> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
> 
> Description of the feature:
> --------------------------
> This series proposes the implementation of a remoteproc tee driver to
> communicate with a TEE trusted application responsible for authenticating
> and loading the remoteproc firmware image in an Arm secure context.
> 
> 1) Principle:
> 
> The remoteproc tee driver provides services to communicate with the OP-TEE
> trusted application running on the Trusted Execution Context (TEE).
> The trusted application in TEE manages the remote processor lifecycle:
> 
> - authenticating and loading firmware images,
> - isolating and securing the remote processor memories,
> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> - managing the start and stop of the firmware by the TEE.
> 
> 2) Format of the signed image:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> 
> 3) OP-TEE trusted application API:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> 
> 4) OP-TEE signature script
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> 
> Example of usage:
> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> 
> 
> 5) Impact on User space Application
> 
> No sysfs impact. The user only needs to provide the signed firmware image
> instead of the ELF image.
> 
> 
> For more information about the implementation, a presentation is available here
> (note that the format of the signed image has evolved between the presentation
> and the integration in OP-TEE).
> 
> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> 
> Arnaud Pouliquen (6):
>   remoteproc: core: Introduce rproc_pa_to_va helper
>   remoteproc: Add TEE support
>   remoteproc: Introduce release_fw optional operation
>   dt-bindings: remoteproc: Add compatibility for TEE support
>   remoteproc: stm32: Create sub-functions to request shutdown and
>     release
>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> 
>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
>  drivers/remoteproc/Kconfig                    |  10 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/remoteproc_core.c          |  52 ++
>  drivers/remoteproc/remoteproc_internal.h      |   6 +
>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
>  include/linux/remoteproc.h                    |   4 +
>  include/linux/remoteproc_tee.h                |  90 +++
>  9 files changed, 935 insertions(+), 44 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>  create mode 100644 include/linux/remoteproc_tee.h
> 
> 
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> -- 
> 2.25.1
> 

