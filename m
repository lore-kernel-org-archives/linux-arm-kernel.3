Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F486D0C844
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osa+xJHGbeo/qaRpfjFH2v35lVfZ55PmRd0/QnD48vU=; b=pUAFbeMXVTS7caUTMvHi4Bw7oF
	ijDyvsm+wGKPAS42Xw9Z9euCW1iquMWtVU8fbBrIbuEcQiQfrdGigk5ZZKC73Uioqmk/s4Xw+yovF
	q9kjuEWqtuhKWe/10FWsygjipqZ19RVWjdcn0apZsYLY0Lvi0oNa2OA+VcAOOMzpeo8Oufvotj/Ey
	y164qofNrbAxFi5aCkzyQXGEE+R9dBqgOXvARfEfujGjNCWDwsi7SvZZrgV9ffC9iQ1jecmExp19M
	OEV3dAAkoMYa3QALgDp5eMpC2cCf/uw+Xr8Odk3bCQCVlkmDIfJsaD9jbrLKx5nw+OjcQ6otIYIE1
	2F5HOFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbhk-00000006udZ-0sDC;
	Tue, 13 Jan 2026 10:32:52 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbhh-00000006ud4-076y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:32:50 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1232d9f25e9so286323c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300368; x=1768905168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osa+xJHGbeo/qaRpfjFH2v35lVfZ55PmRd0/QnD48vU=;
        b=BOqaOsF+LGTghGtqJFG3Kn2Aumhl4M7TELO32QLaErFUaJBbGk9CCcisnGDBhAp0sD
         3r+SkHUYqkc/AbPVwL5fquOtJ62O4i5faLiSVX6CyVYSRzR+x/Ol14doADWebBzDJDVI
         Nhv+10Z6JOCH72TJFmESycNTTMXMYUdj8TNHb8ngWyEVp608GtJqmxqnYooJAP+I+DBd
         lbO9wGDbRl3JBPG9ftnN47KBfAoz48fzmRCP+D5GGKKO2fZWmQVTYRK46+QH98VHvB4l
         fu3xeWgtoeOqgwhuUzvXtRU5X88iXrAmyvdQ6FVuwj+3/2VdqGw2ZFj+BACzhiXGkblY
         UDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300368; x=1768905168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osa+xJHGbeo/qaRpfjFH2v35lVfZ55PmRd0/QnD48vU=;
        b=EcVVRt4LPGutdZbJ7ij9AJ0G0q9ScVhDJMuSFVoZ0S49WlW6VcjK2qJvjXqpr0pww+
         lOjxh9x/A8WOf8D5hVk3HAhlmF15UCLvG4HdgfMTld5f/O4IeHWbzaLnBcpstiz0b86l
         5GJSgjamoD6+91actaC6uP4fFw1KodjtMj2NeTqIt13nocv0hTe17TosHpClijESism8
         IPt/L417KOw8VXpxHnesjU3SU9tV8F/T2dPwFDCXIRioxD516CqjPkLG6QMBaSTUwY/Q
         oUOG+xb4mjfUDCQeCHesTu4P+d13me7WwyLG3uQBaSQFvdGjLE4j1+mRsGA/kLj4UL/p
         nUmA==
X-Forwarded-Encrypted: i=1; AJvYcCUW2pangsNFIG0d8x6+dWQDxDQNpECZHR3/+mUtS3OK4m/fO1o/rj1AtZ5dsK/XQh/VwgVSBmbey7+fjNcQZTFq@lists.infradead.org
X-Gm-Message-State: AOJu0YzOEbbwWxs5CBpD1e/Mt07CvA0ALFiJP5JtxIAhfn5fDNLuKwA9
	S0ATeh/2vgkGHNHEzRCa+W4RJMah0We6WYhAB7roN7UcKQedY/xKN7fdg34ATC9Mlb3V3KHcbWn
	DIN7pwTAIX2xvzmgzBwrIL6+7aSvrjMI=
X-Gm-Gg: AY/fxX5mOws4x+WE3QVk1IyXHBKGShvmGXazJdatI4XT2KETLYoI9a8pb4TNjx/na+S
	aHDnwh4ykQ35tK1IlxOn+yeBkWyxnf9ipaT99rfCYd45R2tcaNOs30fO1JwjZfk5Y2/bYsJhKzV
	Wi1nrCOzQi9MCirFEbMdA/ld415fzkkywxZCTYtREll1pONuzBeIzcwIOwqQdeSZcOckrBy5upQ
	7LaXgq0nWWiAvT5s7r3VCWDctKHMAoLTpAPWiA4VVxxkHC9A66F5sFFMNeKbq0954dlN0cTC36s
	g6gTbLLj2KKAY9S2fIQQzc0LSJQOmpGg8aft/maUyt2ZCErZQNxfSmBrl0ym0JrfVV+PMo3GB8U
	it7B8xB54rg==
X-Google-Smtp-Source: AGHT+IEgK7geK/3cl8glUX3kvw7WMOfIDt2tBZpuAwsH31XulbEBmQ7DbpdByWJmbKz9iTb4wDcBLYcU2OxmyHrWmzI=
X-Received: by 2002:a05:7022:eacb:b0:11a:fe6f:806a with SMTP id
 a92af1059eb24-121f8b4df9emr21162959c88.31.1768300367916; Tue, 13 Jan 2026
 02:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com> <20260109-imx95-rproc-2026-1-8-v6-4-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-4-d2fefb36263d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 12:35:17 +0200
X-Gm-Features: AZwV_Qiq_ikDCBbZhohG-5uh93Q5VVXl1wxrH8Z59kRq7qiDXmFqbdmDKMYIm24
Message-ID: <CAEnQRZA6aLBJd29ySMCnD4y93m7TRS3vDTqN993jiL6QoUfyBg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] remoteproc: imx_rproc: Add support for System
 Manager LMM API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_023249_344924_BB496BFD 
X-CRM114-Status: GOOD (  23.82  )
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

On Fri, Jan 9, 2026 at 2:11=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
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
>    if Linux LM ID is not same as M7 LM ID(linux and M7 in same LM), use
>    LMM protocol to start/stop. CPU protocol support will be added in the
>    following patch. Whether using CPU or LMM protocol to start/stop, the
>    M7 status detection could use CPU protocol to detect started or not. S=
o
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
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Ok, for my R-b tag but in this case of re-writing the code in the
future please remove the tag
as new reviews needs to be done.

The code is OK although it needs a bit of a time to understand it. The
commit message should
only point important stuff - that cannot be understood from the code easily=
.

Overall, I'm fine with this. I think it is in a mergeable form.

