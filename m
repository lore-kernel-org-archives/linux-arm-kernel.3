Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C8DCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 15:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=; b=eYzSCp1KNO8bUPx9SYTgkL3kDX
	BQ2U2alPcqqKPxSoV8QnGab2iTXUxDZvxPOlDUV0iDPx14yigAloAuInaVOEbvtbaVMjoPDoahAsQ
	nVVRKt3eec1NZPAwpXmo2pAk3u9xsIxCfaZbo3ERYBmctjXyxm9HiHBnck+8He9mkXvUgHOtbNyAB
	8hnNcKcUHnVidoMHueUKPQli/+B2VGTehJ94E3Tv4GD7qbSmO0Zxop2xi0ugvNMIxDc2EAjUqHskr
	Fnx3CtjRe+gS83OQfw8YEJtx/gE3lxUMxTfI2YXV9CFn3omgATfmQhP/hn9Vor6mKMzQYjV4aBqtX
	fHRAPlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0sZ-0000000GJLE-48aY;
	Mon, 17 Nov 2025 15:10:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0sX-0000000GJKl-23Wy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 15:10:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHECb2t4166706
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 15:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=; b=OREd6A0F037sF1VT
	OEdbZ4GyZWZJwpHnFFS8IU7If1hIVFXrmL3BgZ9ZyNWTwpe6cD7mu6uIAUNHFw6t
	cqveLssSVTYiCUKSwwHRgXdB8tYDvyLTYMh6wLlBygB648Vcqlqb7i3xQW/cRZse
	JQ7MrA4/kxGCY4nEYqVTyI+H/ed0QmGWVU8UP3f6qSKtuCSZ8e8ptIZqSsMx+H0P
	EmYawz9/IjU81nyrPSHzXrImTthBUtFC4oSM8Yk15TqgQ5sOMwJY1EVDAfkVsymC
	cHFp62K0U+0IPUrqETMBgDVL9DHjzKVuC1qHPpTPnTs7PbS6NU/4ukfC0b72pV2R
	clsrHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593r5q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 15:10:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so10606617a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 07:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763392252; x=1763997052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=;
        b=f5+eaxoVEBy/vsJvsa7lwED7URP7UGmE1LsP03lB8bj3qU8aoYw5sz3rwGa2VfFjsM
         2fXzPRKkVYf4eGgWnpi8dn5EnztkVTlI+3axPb5gl9s+emoHT4oS4X4nmSRB5HYJVzQh
         Xd0X68v2MWMdl64AGoWw4alu/i1fpdKdtzXbDOO9dzKWBZroiOzDE9sBEwAO6u7vgsNt
         K7w1oxwTeG3KKLdaQdvqZVP9jZ1Z19sHV+8ePsR6KYxalsA3Te9VtpJsGph9HEf36ovL
         6T8L5apaC/QlTWLvbH53IK4KW4staTWvBEIRszOQ/7GFK5yNEBtVmkQajm2Bvr2AWkWJ
         /nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763392252; x=1763997052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=;
        b=fjexnQ1pMwJaIN/etVv5oU7J4RMJXPWOJhvXBeo1hO9NoRJ4XDniMuj01hBmaGy2Fa
         Y/yz5FkeWgDaGBr9BTDxy2wkHGTjGQo3TnabNjR6AkDxQNQNX/Ni8yWZwqLuy3fr8duK
         zuHAGzIFDkFFvKl7+iTH3tjdgbACs+K9400rxLWTcfYN9gOtuyHEs+xUeW+hZEi8Gph8
         Omthqw4i+uB6hTpwLL8p4qbHhzFq9Kw+Kfkqtzlu1A0MLGJlrGUijBTRiFzxKqXEaNae
         cCG5UrJTEeYAE8QeEZ8Qy/tBMg4bycZmQm3ST5G/GY2RU3t0Y9QU21LepzAW3eux/mWD
         H2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVRHLxm/d0BUk77aVej1A6gYqC0rDoovjrgd5qy7+K7PpL0RttQensP7uYneH9b0PbaWz0yOhuOrqVn1QMJMZBz@lists.infradead.org
X-Gm-Message-State: AOJu0YzRL7c6RL3+S1JHU/tTq52L+KUhzTA2w+mM4hxq0UPFzEJUzZfI
	QjSFtotrh0Why9/e8f+MjbT5PYKRpl/97F7l2zecokkaw/IOOB0VE2GOyiCNrvpG3oFpnnOn/yE
	z2S58X3fE8EQFvOVkH5SjZ/DC9ezLpOx9rMPPMTXNWxLjdxQI4cRdhK2JyCnY3hpaTNNjSLIMJS
	nqKg==
X-Gm-Gg: ASbGnctouO77vIfXF5H1wAWn/Zj/VM1EjxpCkPYcRJGAJIftp3TUn4t9h2zx3WJDpAk
	ifJH6GNVE9VeM80F9xLCD2q2Oo0GES69oJ9kfoUnPAN0JR1Qjg8iYuH7ihlnr2bvzW/Wo60Vj8X
	BMYobyGhBhuU2xUn245AkqA8m66/m5tNBee6OtZKLsxacX7V0PL+RJ9OpHZLvLQkNt9yfJEEWUe
	YeQboDoQe9/ovHwx48btUUmU0yxJz1+QGopQBa2oBav/kDBikvqn2pEGz/XxfEPliW2pelzvphx
	oCQAmeyJBzfkDZdH4DuHjp6uYJY2puQip6pwFZDZOXd8yEaGPLXfcwyw7lIH+/pbDFqTwz2Q
X-Received: by 2002:a17:90b:514e:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-343f9ea68aamr15342285a91.4.1763392251666;
        Mon, 17 Nov 2025 07:10:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbsQ08i3RpDgpHclLMhdgzdyoJ+w6CtMbBeyMNLvGdDTzxKR1J3yh37uQpCSBsZD5+fmLg4w==
X-Received: by 2002:a17:90b:514e:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-343f9ea68aamr15342231a91.4.1763392251198;
        Mon, 17 Nov 2025 07:10:51 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07d2e5esm18476478a91.17.2025.11.17.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:10:50 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251114-perst_ep-v1-1-e7976317a890@foss.st.com>
References: <20251114-perst_ep-v1-1-e7976317a890@foss.st.com>
Subject: Re: [PATCH] PCI: stm32: Fix LTSSM EP race with start link.
Message-Id: <176339224773.8361.12189431111845230002.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 20:40:47 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691b3afc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=dc-18obONeaZi32LRPcA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyOSBTYWx0ZWRfX7gYQbydPm6es
 BT9J6X6RQcmBNUfcPIEpF7EXDRwPMcJ9oqq6vV533nvT7aXOjgSNfk3zwFq2J6D2PJEKhNkG0/l
 cyMvVhZBqeKMpc4Zc/OA5qpEE/uya5gyQmj6ePIQEF5yKimtc2X8P/n/NQj/FYhD0EHmneHFKya
 pHNDEzp5KeOc/vq7f/Fwg5xmEYODBm68GsuiUT5JzO4SbSf+BGlHYYBtfnHapd0ia1+Civp6Vsh
 hrN/qUalJRrGhVsjHx+BISu/5+QvP//f8cmeb7RkX8v3oucxEgj/rJPfV3GUfUD0j5FaSa++DHD
 9SSaWU3Z8xTcelrqkxTBLNfs8vd8f7IpZMLNPESOxHN4OKpDkQ1d/z6EkYZZuJtKyNM12Zn4qb5
 qbPVL5nk9fyRdclpOqt5a6TFCwz1Qg==
X-Proofpoint-ORIG-GUID: Cd0Gv_FviBl8i2hYX6KF1BWLHbqpI0Kp
X-Proofpoint-GUID: Cd0Gv_FviBl8i2hYX6KF1BWLHbqpI0Kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_071053_537566_47E483CA 
X-CRM114-Status: GOOD (  11.31  )
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


On Fri, 14 Nov 2025 08:45:52 +0100, Christian Bruel wrote:
> If the host has deasserted PERST# and started link training before the link
> is started on EP side, enabling LTSSM before the endpoint registers are
> initialized in the perst_irq handler results in probing incorrect values.
> 
> Thus, wait for the PERST# level-triggered interrupt to start link training
> at the end of initialization and cleanup the stm32_pcie_[start stop]_link
> functions.
> 
> [...]

Applied, thanks!

[1/1] PCI: stm32: Fix LTSSM EP race with start link.
      commit: acca17da9c9f53c0aa05bbdef255213d36dc09db

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


