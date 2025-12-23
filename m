Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15E4E6F08A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=; b=e7j8A/QuSanQx1e6oRqOupFrFp
	KlL69aXCYAiP6Gcr/e2YvZK9Z/coAn/IwLDb2eGObkq/Z48BPzA1c8OdB1Nh0BkTO8cHMwFA8MJ1E
	2ASVZvjAbc+ng8csfQR2vsXKV61SDjw16/itZRtRHuAN6xBnLTnC0MxLXK94fC8y2vzT8JVgSiosU
	0QzS4SyYpCgeXAZC8Z9k2jfir3MBrTgA8AhaZQw2vWq28TVkfB2FiSOG4sdG9sw5CGqlPCr2974iT
	41pagjf30UoHb0wykqkzqRXiZm06jRornQ5kolaiCa05OqPcceVt+KoFeaoRm93Y2dWsOhMYuVCNj
	KkW6ny2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1bj-0000000FTF2-0iOy;
	Tue, 23 Dec 2025 12:35:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1bh-0000000FTE4-0aa0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 12:35:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8iR1r2747219
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=; b=cAgLW6ixYruoNWrd
	ibsU+dchJ5vfjdDxoL8JD2QmijCzl5+E04VKEScXa2c9EOwpahruDRSoIVjyvB2n
	OgVtZRydnEIY1D3letMEuXQi3tBvwA2mJU48I3/Htwp9nif/Dkm/aEb1E0ZkvX+s
	zkwjSkKYlZFmTOnenI88XMXNMVOQO0Av2lvclDrHwOK4VE8ucyUmC/EpVY3WBfKm
	3eg++2CfsYHIUOcpmULsU6XtN9OpO7pdIG8JlEynjpg6OPbMk0PwbVV+s/zE2l8q
	FxJKEo7byvQEWeds+FiPVReTGJHOGJYMhc6lkztRADRiTozkaXpD6qut2gkR0xLh
	+GpX0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ct34d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:35:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso77949675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 04:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493316; x=1767098116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=;
        b=c6LB/xyDIIFYsq7BgiuVc/8vHPXUcBAlYncu1wXpsWE8L1TAvKeJjij5dYxbjJtb1d
         4GgZdmxjV+cVRVarTxKeWLQ6osRDm2OqCVtSicDpbb3ntE2+KhDGk7rMRloyt+U636W+
         DvBtpz7RavRs/SuFIdBOludE9hK99H3uQ4ha1iFznEkGDBFXhZUbeN4QlImv+tT4qTul
         z86ZgR8E5Hu4O7YGW0AcbMk4FuAdhSAPAoPjNfNaMi+3B0qE29b+UnLyh8/8rO39smVG
         IR1kMC52aJqC5Mp7DsqicNpZol1wq4EGKyC8GjIEzryYwekgaNVrN6FeBo8Y6VY5RAnS
         kXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493316; x=1767098116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=;
        b=pvrjBX07YHlfuD1H9oDIujlZhbM8ldqngK2ZGcDFtdzB53NBg4fJx2oOfS8Fvd40Bv
         ZfWMGTqzPBqAvUFHhwD/b89TxuVvIW+6ocudzGMon6aEsQvfPkGeh12kjajsybIuFYKX
         k4zg6NzRbSbEBVf19jtm7fahk7fD+Pyhk16Z+hltnsyI7zmN2AcFE3v0091WemcFPWZR
         VIhcHDSFA4TosRlvJA9eDxmlnS8mnXgUO9JcI4jv3M0n6HnB1TAeKH7CQhdbBx0IB/v1
         aQqnrWgPN7HXl8k7SEXZJDIEwQMkAtnLEt1Rw0RAf4/dfrmq2gSfV1VZl71E929jX3gG
         P7bw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Ao5vt+jLeo/jWfRlRVK+Qbu/+vdlID5ZsFAnZdLA5NiifMcH7QgO06F4mj7XkgNix7OUItoLQEcFz1GHz5dh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/mYPeVn+xbqrwSTc8XmFC7B/vtZLizahT6pIjjnXhm10dzwQK
	SXYGoaFvl0cos8d1Csz3k+sQHa4jMn6dSUTN1wVX1XoJZA63eyFdYbRP8GzY4TZZFfShOTYza45
	Y3mAMOjPQzUKswWjvto9FGlr/b3KIBN3GzkkEOzzcg3sgWTCC2Xzrg/OwhGcfofUm9iVtkmrYYe
	ZGGQ==
X-Gm-Gg: AY/fxX5jgc6inqINFboSFZdh1e/nLzMcG4QCtduZp+zc/8be6khREX1NDRFm8KLzH0b
	h+yGI1GzqZX+aTJl9djw9otdw5Wx9iQsVp+AKx+mMqP6Y1/G659K1qcXU66ol4teS/oPrmaQc/E
	fOSD/OHNRHC4B26r9ioU5QxElDWBGo3P/ruy3ZNRi/82gWUhtt9tHWUchB2Imw3Tg2lbr3txW9V
	nXu87xfBX9qxaz/hAgAA5fBSzgvuyZ2n7lwrcIM7Ay7ty4rkeUbpM7Lx0RotqEWrOh8/LvhvB5n
	Xd0PwsAqaxmvToYjOVORbnz53FeA+1fd+H6c1EOABPKCWB8Vp0lrdn8Bkf5V0Z99Rwyw3KZMBs6
	ujNTEJhE4
X-Received: by 2002:a17:903:2a85:b0:2a0:c1f5:c695 with SMTP id d9443c01a7336-2a2f2223709mr154383875ad.16.1766493315927;
        Tue, 23 Dec 2025 04:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK/WfPK7ehic7AykZDkqMohCsuORpQskp+MgJ/qxEP+NjSVB3+4rmjRKLgNtSu8ssfUpESfg==
X-Received: by 2002:a17:903:2a85:b0:2a0:c1f5:c695 with SMTP id d9443c01a7336-2a2f2223709mr154383625ad.16.1766493315435;
        Tue, 23 Dec 2025 04:35:15 -0800 (PST)
Received: from [192.168.1.102] ([120.60.139.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm128637585ad.60.2025.12.23.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:35:15 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251211064821.2707001-1-hongxing.zhu@nxp.com>
References: <20251211064821.2707001-1-hongxing.zhu@nxp.com>
Subject: Re: (subset) [PATCH v10 0/4] PCI: imx6: Add external reference
 clock mode support
Message-Id: <176649331066.523506.9443864112044699350.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 18:05:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX9T//gyDBK4kh
 Sh2PJqZ5be8oehCtHszGq5PTJZnkzYXe+jh0FXN0TR1zEsSZSHrWB0iTdcS8Qex1boUe/jAbWOq
 yqryMg12DWQm3QG0k6kk5sGDUHRmwmlPOc01Dps/xd4+bNHoYHcTYQ3C86iKtMpfBFCZD0izrnj
 lbnzxZ6uTInYUtmuTp3g89qUK/noY9exRh3tuHQF4NvUYplh0zv/oDdm3K8oyUZ6gB4Ou8dRQyH
 wKQJ70FwJV1Virfdx4L8vSoLKEqEpIyfNRMzo+af55OpqDSA66Nc71hgGdx9KK7J8MkDC55cTpM
 nqOtcNEL9H6Me0dYWfSm4lqVZaUFh+iRiFvu8jrVTeptBuKLAgUmm+PaLiucI2SlephByiRw6RU
 Ax1O1VcCjhbo1z+7MqcHJnq3RKkOTpz6JfbrJf2ahMuyFvPUaJOhnRdkVXQoy3OX95q+kJCMMvg
 LfN4UtanzGBdQ/zZoqg==
X-Proofpoint-ORIG-GUID: 4Dd_Wsr-lwAK8t9hxeLQZDmf_T0fcfNT
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a8c84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=wbxd9xFQoh2bOL7BUxlcyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EXx6v-oOm7wFthy7ysMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 4Dd_Wsr-lwAK8t9hxeLQZDmf_T0fcfNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_043517_279327_1B2A23C9 
X-CRM114-Status: GOOD (  13.92  )
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


On Thu, 11 Dec 2025 14:48:17 +0800, Richard Zhu wrote:
> I'm really sorry to send this version patch-set late, because that I was
> engaged in other emergent tasks in the past weeks. And didn't have time
> to continue this topic. Now, I have chance to continue doing this again.
> Sorry to bring the inconvenience to the patch review.
> 
> i.MX95 PCIes have two reference clock inputs: one from internal PLL.
> It's wired inside chip and present as "ref" clock. It's not an optional
> clock. The other from off chip crystal oscillator. The "extref" clock
> refers to a reference clock from an external crystal oscillator through
> the CLKIN_N/P pair PADs. It is an optional clock, relied on the board
> design.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: PCI: dwc: Add external reference clock input
      commit: 418970983059aa06302ddd5ca76d441973b537c1
[2/4] dt-bindings: PCI: pci-imx6: Add external reference clock input
      commit: 1352f58d7c8dfb6ba0fbd2041bfc8b4b3966ec67
[3/4] PCI: imx6: Add external reference clock input mode support
      commit: d8574ce57d760a958623c8f6bc3c55b5187a7bd7

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


