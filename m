Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6C6E67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=; b=EdPLTkhhCWQIvOMvk77lNDSLUr
	u83JYH/dknR/piQDr9zVxvkXwPMZ5F4T1lNPh+1FNt+RAvRXYlIyPbY0xTdai7b5HLCaO1rDoJ0PU
	TBElF+/6extCZPs3MWtD7RsFe1o/ses8m3bKP/uDCyrqP5u67BDWJ0W7RjBLb7/Tv2sm2i+R1kGfV
	z5fHHh+H3ljgi8UZ/EjxvfHWf9/Un9qwveY6w7Toxym2827ZZrAOq1IFNpsnWdWroD3B0Swwl4vLG
	VLFnad8PeOwaeD8CHUD71XPgMWHi38ZPd4EmYrxZdIM18iSeXwYxSLxsMvPWOaJ50lVyNYNicULtl
	hLb5GYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjIr-0000000E0Ax-2gl7;
	Mon, 22 Dec 2025 17:02:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjIq-0000000E0AN-0CX8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 17:02:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMGqvDK1902176
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 17:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=; b=WQMnjwB66gwdW62R
	NJptTlmB7Qo6HsBaPOd2eYKPEY4bEAnyoIf76Cia+E+0PdYnnYjv9Oq2XMkrw6mu
	axqLCB8+1c4W2iKoXaqXIqOtpB0gCi+5T1jXBffDT5vLnT16XjvawVkpdKyAt+k6
	jdnZhIqbCj1JpE2Oa9LOapFOU48+60uZ5ONw8+VaSKoKs1Ss5ywl+SCWwleN/12T
	wFHqqyP1qTh1JDoWKPlMz5jdNRpyLvssHrQ1GLNoHPSgt/OvF61Co64N5q3sHHsX
	IeOQbU3V1XZza5ge0vnovo5SaeACEigCpU6YvMMis7afS9is6bQ5vc+4Y1hx2EQS
	pPbZ/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8g0xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 17:02:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d203988so8559537a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766422952; x=1767027752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=;
        b=geRCwoF9Z8uR/GKuThzkB81KQw4ABuPAre8j1mNGxVezcfg6KWIX9OOPw9b7wBmJz2
         kusdZUgwPHbaTQb1iNbAjzIVC01YmsRQXohVWy1x/HJwIMQxgjNof6ckpnO8yaoH6ORw
         VPMixAfcfNU9qmA1ynMzKQPBtCZA1STCOZBuVlY5F4hABWC6AqvS9wZz0tlX6QcBL0E4
         g8hnqi64qmsUwFMJQTSeOSZW9F3CCSiQKG/GOnX+f5QXYU0EidpImlMrKGHKKPl/gfMP
         onx1BO53ETKCE+6cFRxfMZK1c6cT0QzSmtjExZ2tnXcp4QRt5BxriKPZK9TAPOBcDAkM
         r7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422952; x=1767027752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=;
        b=eIkc6jukFnHBIZWW2Ryx4xZbTEfEyMg2y9ncuCsoxcNPXlGTtsYLhIn4akfBJ5lW59
         cmK6ER5vdr8lsidYVc2mP4oI42jlozcHKratnt5Z+9AMl4/zKq+1sWVl+Ew6q2Z6S8bh
         Ou76vfUeg/lh5WqZgOSfJFlXi+3CGEIaaG/n3KotEKZRG5sNY4CDJJakRDNHKv2S+ybp
         1SOgiCZBJDmIZ/BRqEudd0jwo5kHHe9ckE/OO2VFfPF514Zk3eDlVOpw95SQ/RjXWokO
         pUcddjp6hM6Dwyze6tipXjJpe9rqp+vylR6zvV5QHYecXWUNIWDhpN09WQkhRPkMM8sx
         j5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVUCAiuyGQWJiYwMiTAWgJ4OZM1o+5Th2/aDlskUEEC+zQqhfKBg66s0da3ek2IKZLtVEOunkPpl6NgnJrD2kE3@lists.infradead.org
X-Gm-Message-State: AOJu0YyocYK9eDgJjt0DrmeKFQbOzld4VPjUyY2l3C8z9/z6dw10/fqS
	Vd1kJycoszXwjI6Fho4Bj1Hnj591Z1G0jtrn3DTn7nxILtYo+79beyCmqIcscDLajzwR1DWko5Z
	ddTrGLfn1RRgE9j20B9LFGwuJWWg7AGZTBQWPyyZA5Ae8XvdLQEORrTh79KPGLDRfWliRfBp9MI
	zIcw==
X-Gm-Gg: AY/fxX4Lg/S8YGuXwEvFtLFonGE2TcD9+22rCmYlnYR95bvWq27lXtNwugnWc3PO5F4
	Cqd93yiufspmaIqnCqdfSiQK0COUKseyp2NHi9J2YPtEHyY+o59jAMRTlqgUyZvlTu3xFsedTxC
	UVsXV5JOXTN41mnqlPf8StsAEjbhz6j0aqaGZs2xb6yxNx7oZuPWlsJXzOlkQ3m1ngkMZM6PIdk
	sS7si0ZL5qYq2ADGbs7QmeXIrjpeq1TYnNUzbXiBe5n1BWQiuic5bZDiyO17h1coS4wSBa4FT7w
	UalVighol2qc4+JV8XWtdQr3CG+/xApjxet3vFhWezK+cjXbpPpC4VLKBJHq+tlgo/MOW6RUoQF
	hpMiOqsuj
X-Received: by 2002:a17:90b:3844:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34e9213011amr10256216a91.6.1766422951535;
        Mon, 22 Dec 2025 09:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhxvYwCBLtPVF5mS7w3vV1awrjYvqTGweCD6BTnP0tnreJxB27rzmNxHnp8YPmNFLzmV8T+A==
X-Received: by 2002:a17:90b:3844:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34e9213011amr10256154a91.6.1766422950785;
        Mon, 22 Dec 2025 09:02:30 -0800 (PST)
Received: from [192.168.1.102] ([120.60.139.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f887sm13636763a91.3.2025.12.22.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:02:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251222064207.3246632-8-cassel@kernel.org>
References: <20251222064207.3246632-8-cassel@kernel.org>
Subject: Re: [PATCH v2 0/6] PCI: dwc: Revert Link Up IRQ support
Message-Id: <176642294649.11053.7692165747212741983.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 22:32:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NiBTYWx0ZWRfXxy83jB5mlszM
 7vYYKXWk9CToM3aM6P8BbzWqBFl+KdsTv2pmYzt/rZrX8D77jy31fwYbgtTw7nnGkA8U74tPyZg
 69WJubDMQARIfrJgQUgICWtQBUDtCDBMAd6nqjo/xgotX8THr85I6SStC7cGtw8MpNQLQSL1Chp
 DO9iPCso2ie69OF0CtWfwqhfFasBWxRcz/ti0o/dOfxtQa2QufHvcrGFFyvzn62KJimIo+on6xa
 +1SCwScZxG/f/8O8kBCpbaW+Vq4o2Ms3HovS9L42mKA/o+gQtrhnCnF9P3OcsyWqieb8DIyIE/v
 c4XRX6MHAeCKl+9SDOfZ1cOBheH5I/P3TlxulUEGGXxR4Odu2JgoNAN9Gav+upD4wI4SOHPEJOU
 yJpYSaRbEZKFc1xzCq0ujeoAwo47PcmjxqmcdGASdcVmtc7kd9BnF6OYzlt3e5iDQ0FfglDG3MQ
 8lzJ7THgi/98fL/0ZLA==
X-Proofpoint-GUID: 6LYMnsapHzf-iE2D9DUIGuydiOGnka6V
X-Proofpoint-ORIG-GUID: 6LYMnsapHzf-iE2D9DUIGuydiOGnka6V
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694979aa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=wbxd9xFQoh2bOL7BUxlcyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=875CWLFNMCvb7f9f5gwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_090236_217121_2E78911E 
X-CRM114-Status: GOOD (  13.26  )
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


On Mon, 22 Dec 2025 07:42:07 +0100, Niklas Cassel wrote:
> Revert all patches related to pcie-designware Root Complex Link Up IRQ
> support.
> 
> While this fake hotplugging was a nice idea, it has shown that this feature
> does not handle PCIe switches correctly:
> pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> [...]

Applied, thanks!

[1/6] Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link Up"
      commit: fc6298086bfacaa7003b0bd1da4e4f42b29f7d77
[2/6] Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ"
      commit: 180c3cfe36786d261a55da52a161f9e279b19a6f
[3/6] Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
      commit: e9ce5b3804436301ab343bc14203a4c14b336d1b
[4/6] Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"
      commit: 7ebdefb87942073679e56cfbc5a72e8fc5441bfc
[5/6] Revert "PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt"
      commit: 9a9793b55854422652ea92625e48277c4651c0fd
[6/6] Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up event"
      commit: 142d5869f6eec3110adda0ad2d931f5b3c22371d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


