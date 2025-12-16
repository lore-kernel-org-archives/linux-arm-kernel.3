Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2A8D5E133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=; b=pSyueV2iRNxMxhfAQUjBcB19fS
	0Z++AupAxAvszm86baIl0dn0+wR8lZAQ8huLgWoIb43uCRygVwm/irD8+WGxbeYjXu2b+xB8Hqc4J
	NfC2iKqETO3fzb4ybOCMZYeQzNekiTF9Eh4Gn3lXoZ67s43RpIbfNHVQ/OMYf8yFTKzhRsu3hoeYq
	9inTkaigIIeJQqF67u2X8eDtvx+Uz7pkIA9oMLiANyLafouAIPTwBsOfStFeKoF9ALMMUCqn0uyeR
	kBB9QQqL082fsCRT29b0SVIUNaFssmL+QTj+XKUGizfs3IfAMhm1rYpJ4mjgIiNrPXwSdwyVzzrTh
	XHX4m96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTYV-00000005973-3esl;
	Tue, 16 Dec 2025 11:49:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTYT-0000000596b-02Nc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:49:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso3675572b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765885764; x=1766490564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=;
        b=lAVs+cRpZVUdBZ2uPcsKAlWQ1aL6OynFPfRwV09Bhg887iaDTW2b9naTgc9el3d7Qd
         xQx6F9tD5YSQAmaxkp4f0pB1fr0P8PmRWhDdQiHf3l9JgjWbWa/S914d89bsiiOOLwEW
         hYZGBg4nGJBR+VnWKiv7uvaBq+09Vqs5OW/62sPjEKeohk+zusv4NUwp7Milpd2xGl/m
         K1/mSx7dY5PHaOE426ORHZVnVharquMbXo7wVBTt+29Ep5YoIwNd5QP3nU9SEzTYJ/IM
         G9nBQoX8Cnr8kaQP/CwdnWhuzgBf0O6P/SRxkEcJPVswAnvxTSwbaMh4eI/BAdlhl7Zt
         ENHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885764; x=1766490564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=;
        b=ErTwOfDTCdZCDRZ2vVbvNXybrH6iJvnVy1Wsn0nP03stQoJvhnKYR6bdI3H04dHQ6N
         Rmuf0RqFdzaDNBAXNhqKcvWpst9R/GQbgxVr2bSvMKKlRXJUBr0MFQSbU0EIH69gy19K
         IgnQ6hItt7In/39gDDOC9SoAdcEYj5CRny24eFzysASV8yJIOqApdHGHZc3S0fbj2X8q
         KlhlWIowcfYZV5N6wYaf3Brn5Sq4iZmTqhMntDV+Claayh+YyrGw7C9vDJ6Yi5+g7G0i
         XpsGNStGp2rClOGzLFZRsqiDburY0KYnf2KfdzpV0i1NlAZGBXk/mhWD8PpMqG1Jj/Dx
         FilQ==
X-Forwarded-Encrypted: i=1; AJvYcCV84/7wJyS3QDwD7JoxEjopYgpviwG5B9+dop17mgpqMxriV9ej2QOYl3w+iYKC99B/3BYBW9Y0oYGyWo+fbAhb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8OtVVfc2l8tOiGnIN7ITLNj5kRK7WJfFgO0OMpeOT7JeEwWjw
	eK2LspDvQc2IqU02J2V4vvCcbuBPY6E2EpnpIXzmHN54k2Ixvx72YyES057am355BmT0xypDYny
	2dNgSBxFmZAjPS8GJlufZaNsY83+jh6E=
X-Gm-Gg: AY/fxX4CTkgRxJEqEtLykwpkkt4P3ykiYpv5QmQpuLuNH3eH3wh07nNb7ScYG0U7gMV
	nViXmlfZ8zH/ARwySp0jOqd6IALIDhNw9KrYidDdV0+SFARHPmYev/PjC66MajTrW7rC6NXn4ly
	VT8Vb/Z46h9D8JNwBKs2YHpGkB4J89i6pGtTwk1sHuMIOgZj8qxCi8DZJTO15xlvQtvhasBYhUh
	52fYFylpT0be+bIck5fPVoimSldY5LcmaF3kGMNclY7pXjetRoiCz7c586XwjsFH1izQjBMf0nF
	tDG6iPluvOs8QiruKx99C/ldsfvAWz5YiDcQUMUwmOj0zUH5TfPyaMvgg+IQL+WzwZ9TgRvn5es
	4GKJrcFk9eA==
X-Google-Smtp-Source: AGHT+IHPEep5dtYauknDb8YyMm1kDWolPZTnV2HvftVKII1DWWjGIN4YN/9xsVgqVLYIfLemujNO/0Bup29BPcFhFqI=
X-Received: by 2002:a05:701b:2415:b0:119:e56b:98a4 with SMTP id
 a92af1059eb24-11f349c583amr8528888c88.11.1765885764035; Tue, 16 Dec 2025
 03:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com> <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Dec 2025 13:51:55 +0200
X-Gm-Features: AQt7F2r5R94-pfKGDYvFfrkyngEDJyIru0ByBqDzhFtMH5nZZaARnweMqygnu0M
Message-ID: <CAEnQRZBS7zzc9AmTymCGVKwExeZ-JNFiG9MamWOZmk=gXdBY7w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_034925_078054_AFE8E76E 
X-CRM114-Status: GOOD (  18.13  )
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

On Tue, Dec 16, 2025 at 3:53=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control i=
t
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whethe=
r
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

