Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1D3EE498E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oahDzZtKp4aKLWOPEag8A9pjZDWXjStTAMgcucgxXPI=; b=1Nm/bJpVDCKwEIkLtfytP+PYpC
	HCi6LX5Xz8RGYS+k0mOnvJg8YUsCWi6gQuuiiDulP9116tnJArZUCljm9JRqM4cKckivoGjcFkBDb
	LvCLHq/Ewid4z/2m8L9DDyqFoXJCx22KZke4SMkuTpVY/KAfRhoCm5IuCZlgiMAmxJtagxa/Bxzj+
	NRHSqar1+RQrKFSw2tCUuVw32qQcVagVt88PsP5b/4FOo+JLVASg9MZVJ+M6xdTjZXc7GZXzmdUCz
	BTzp5wXOC7Scxi76T2kyBBz6UEb/JoTboUIjMDZokAUueiHMEr6DJMqu3D4mc1xmiBFkTqpCHbOGB
	GSFiLIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vad95-000000055yE-2DdU;
	Tue, 30 Dec 2025 17:04:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vad93-000000055xv-1s0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:04:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8nKx3971212
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 17:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oahDzZtKp4aKLWOPEag8A9pjZDWXjStTAMgcucgxXPI=; b=JXGZfnXNfLVFmMON
	bIOd9bLLjqETvvUvWjMIwTVw82vA3dmQa1Y+HwVdUF3PomATZSd94eB4jg7E6v0h
	iGe1ff1Avvl8N815zbLxJi0i1gqB01ivEw/q+3TZcAtqF13Labnu//Rov+HuLVJg
	P+Vz6yGeaY83s28TuYRGrEva9YKj5UTTeZ6D8CD7AkS11B2mpDmfErbPFbRMqlGF
	PxxZEvwzDTYGopvQNw4Nw+6I/l97LBfD6xMuitrjEC1X16/3YnH5/t2MFNqvErGo
	5cyBl6PAQnhH3qYENbn6EUTBwRK1Rcrqt4AAvJ0A/KsAJhn9Pj/eOFTZei9heWlU
	Qz1WGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky0t9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 17:04:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c213419f5so9351266a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 09:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114268; x=1767719068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oahDzZtKp4aKLWOPEag8A9pjZDWXjStTAMgcucgxXPI=;
        b=jGAYmUJMZJGGLvlJQ7Qbaf+H32MbgE4Q6FmQGHMzm2y6w/d6pqYUs5AUElF8mykHm4
         vwd6e6GMzm8XUSlJ8pTvjSk9bm9JjUbrw8zNtiWsxFvoe89UbmWHgaJSl1wiOHQ4wuL3
         ofzP0Ry8zrYhaDaJxUb3UqEjiMUzownYCCiz8A8miIzV+Dkir2qfJSTb6xdMAlG9jBoS
         O4j5qzytVh0diBTT9rNo8B87sxbFeTH7Cwxe6jsH4/lFXDp50OBVw5xsWDFcIiog8lOZ
         h9h+9C450naSeQamqnd0ijuzbOe8GGp2+SA//bMsGMiV39s373mdH5J/9OoyVbfqrB3a
         7lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114268; x=1767719068;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oahDzZtKp4aKLWOPEag8A9pjZDWXjStTAMgcucgxXPI=;
        b=fD6kgxXN888NM6EqEGK+3U2i3Fs7WFSzNsryBoCesQRfzSUwxcJFllNZ52V1gc77jt
         Ypmmgbww++hbINNV314RbKAYj8WfP6jqYmeCf+8rko8m2mFwykmddiEnFTKXevfuCkLd
         Q53HUEDrTtk7vKLJC1urep2Rd868q9xj/F1Ca5UyAvJ+ESa2HxQjXWLk3YPdtlSEvN/u
         arZzVS0/8hbhubcEp9FhLDeyMEgTSsyOe9ZkD8nTT6pwVNYuoIYeQMhurPbUCnBcv1UG
         KTf92DXQ60Z65jcLO+y/T2jenPUFyBscW4zSrL2QwdfdaJkMZ+IwEbxeRhyclfNM5Wjr
         qDRg==
X-Forwarded-Encrypted: i=1; AJvYcCWEyJI0jyvElVnahB2iCOJHh9bBRNaa5qlxmOYAaipGpOCdFw4d+7+apDrpNOxKc1BxZzLCdgDz25EUiFoiLgKC@lists.infradead.org
X-Gm-Message-State: AOJu0YyYWiAXMiK4okq47G/fI55ZAVHwmxbys8z2Z5D/gbDxyxiMN2W2
	mNCyAhg+v8/9bPGZlRfoyHIHBNaCxpUDkYbhMQqC8ZmZg/SoukOBDr1AgOQ70is6a/Vl1LZXwab
	4FEkS6aoueopxHCG7tU9k0OA3Qnk80nwmvj/UYaelngr8+Y+RIW2m8B2Rx1CiNW65RJpUTjFlzE
	FjEQ==
X-Gm-Gg: AY/fxX4cVRhDe/ZNoS+6cbnaw5YMSqzigoCABZMHz3eyqlPGjYtKKUJuFaqfadPsxF1
	Cmts2bliDqiD+e4Rx/SUmrS/t9vAsI+iBQd52SOvCG0uSypSVo7jwb4BaTUIEaCoT5jPgSB6f7B
	+2DvYayHJo/9aETE7X5teIe9XIF0VQVPUz+M8H7y+vJDvHXFaQwTTHHBfA3C+bVE4SxlgGy0TTe
	0sP3P5BVtQhaVkzJKQ/F0/d3WrqFTuvXocZ4S4OH2QEnsusbM+XrcP0M89CIe2K13kapQNPEylq
	unkD2MeQU1RcbjkPr9XdMGwhOe5s62zdoLyVHxIPygx/yQPVZjCmcXalGZB9T62FtfPSxlnCnwx
	Md9PNTrc=
X-Received: by 2002:a05:6a20:9392:b0:35b:4f5c:4adf with SMTP id adf61e73a8af0-376a96baae6mr27914898637.43.1767114267723;
        Tue, 30 Dec 2025 09:04:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2Rl5LfHDVkgfWMi9X/mea7YMMMGHUdRao3zak1EyBlsAdgBNCXkb1Y5Gc9zz6/BvvBV62jQ==
X-Received: by 2002:a05:6a20:9392:b0:35b:4f5c:4adf with SMTP id adf61e73a8af0-376a96baae6mr27914869637.43.1767114267222;
        Tue, 30 Dec 2025 09:04:27 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b1666sm30515521a91.7.2025.12.30.09.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:04:26 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251215212456.3317558-1-robh@kernel.org>
References: <20251215212456.3317558-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: socionext,uniphier-pcie: Fix
 interrupt controller node name
Message-Id: <176711426350.2039520.18416499850960877912.b4-ty@kernel.org>
Date: Tue, 30 Dec 2025 22:34:23 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX8G+49DbJfByj
 N5r2HLmQGh+Hyj7RutL+RsQtFA2wqNSw8BeeZqH6jB7bf1tGTXo6NF4Ws6KuD49uZZM5SrIRkZj
 OCVi+B6Ezi3sf2pdfDnprDhHFOplm3/nWDfeMQBr5ZiF8kmXNFRKNqmVkViE1J9Z8PYjKdIHmr/
 vhmg5a2mLsCEgDovbR60ovPgfCPgDe4m5HtRMVwwOiuDJO17wAw+pwaTyRJPmL4oVX8dP07qf6S
 Uy3xOfmPAuNtMcvefr0ymV0VK9Ztbng0VamOwn/OH2Ax4lvLgaXMi4Ka52dM0Oy83j5HAt19Q4Y
 2kKWIuypiPGLCmo5KuhEbO8e85XBrOD0sRSsQBJr75WvwZA6m31ihg8PeSOk4cWgvEJPsP0yfIm
 Wvdy8SfcVu3HFYYos9If1ucxrJh6C/dRDKDfgSx91VJ0ftVpKRefJ7weSMVBmjvYvRwf861T767
 S8JtmGOSqwshzBARRgA==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6954061c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=W_j9OZaKoQe7uW5gK9QA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uRAmdTDabJ9OzSWLta_QgCxXljzzaIdI
X-Proofpoint-ORIG-GUID: uRAmdTDabJ9OzSWLta_QgCxXljzzaIdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_090429_493243_11319F43 
X-CRM114-Status: UNSURE (   9.92  )
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


On Mon, 15 Dec 2025 15:24:56 -0600, Rob Herring (Arm) wrote:
> The child node name in use by .dts files and the driver is
> "legacy-interrupt-controller", not "interrupt-controller".
> 
> 

Applied, thanks!

[1/1] dt-bindings: PCI: socionext,uniphier-pcie: Fix interrupt controller node name
      commit: 2cca8d79709e1debd27da5dcae2abc859f41db70

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


