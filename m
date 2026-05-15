Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DC6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hlkm53EkOwBFPaDIOKZBSELdA8nHYftS688xEuOoghU=; b=WEY+A02ZAG68PM
	eVfNvf1u7kQFZPVcVVMEKIzv0Zp6AkQzuLPWhPJ8Gfd/OYL1Ifh3C6sV7Q6QRIjPpNzDvMVT/dmuw
	6KSk0uA0HFZ+Elcghqk15AA6CsN8dqzxwooKO/mELSpSWU4xekY2RtZHOeuOGT2Xcq5IbFVxZrW1a
	TujhpxU+KNq/04HG98v4JOsEikd8qUyUrpy/8KgZLYTbBJD4waGu+fAg7I7wKG0kyBehx3QAW2YoZ
	cbckA765faiVyad9yxb25RhOvQwyXe1/aW16Ek6CdkOJYp32Z7Uih5iwOWB1ZUNWCo9wYdw+jkI2o
	JVw/+jjvH1L2l9+y1VPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtRW-00000008YwJ-3WK8;
	Fri, 15 May 2026 14:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtRR-00000008Ytd-3vhh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 14:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hlkm53EkOwBFPaDIOKZBSELdA8nHYftS688xEuOoghU=; b=k8juq0ty3sBE8rvs4M2zxDC2LX
	AWJA1S0m9IXPtxlPB0R+2SYojoiMqghhmuIk5dGJ2U1acRU3hCpfKf9enlBBfR+N7P+nmPy9H/2B5
	d7tivIfeFEIK7dJTpjrAOWIYupcqh+ishwIdu2EoTlkT0n5IaG2mKu2v421lPwYP7b41ovY3F4tqV
	OWQZwsEfTbeqSuvKvqrVaN2/5m+pSXE9sDoWeJ+I6KFoE+1ykIf2yxOth8kGcPhS6pjZ+WUnk5dBc
	73j7YE/Le8dfPFkHTyn1Y+AVJ+a07JSqrBzC/g6m5kRS5LOiOI9umSU3tWb4haze9X8T+9eSUCgj/
	6QSUSueg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtRN-00000005RBf-2WjH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 14:23:04 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAe4wY4193977;
	Fri, 15 May 2026 14:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=hlkm53EkOwBFPaDIOKZBSELdA8nH
	YftS688xEuOoghU=; b=Jpe7yWrR8pmsxBAomkb7A8nSDqw87mI8kHQ7yDJe49Py
	VpBgiArLXfLuAHCzt1eS3bwAZcLv72q6thYXwsF8FygOLqT0r9EeuVHDMRjANeHv
	HfTRYVp+qEFfDQG13wEbLTb+ZywWOVWjffNt5Qz7YoiDwYFasG2iV0+fjfHc8E1b
	fXZHA90876Kk6UqjxzTIhg6Pj+9Cqit+wC3jY9ISzAazQOblJAV0XvjPUqXh5VpQ
	AeUpISsK9hfy8JPjD+fAhjoB99xqam5KPFbBN4NKylP5Hq5D9QIiD9j/ugdNrJqK
	V1EqiJ6d5P9EDtVCKJN5X+IEcuIUWrzZ5B904HhHSA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e5m8y3f7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 14:22:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64FE9aaL006591;
	Fri, 15 May 2026 14:22:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e5kvckve3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 14:22:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64FEMNDm17236336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 May 2026 14:22:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71F5A2004B;
	Fri, 15 May 2026 14:22:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C71220043;
	Fri, 15 May 2026 14:22:22 +0000 (GMT)
Received: from [192.168.178.55] (unknown [9.87.148.246])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 May 2026 14:22:22 +0000 (GMT)
From: Gerd Bayer <gbayer@linux.ibm.com>
Subject: [PATCH 0/5] PCI: Finally make pci_root_buses private
Date: Fri, 15 May 2026 16:22:02 +0200
Message-Id: <20260515-priv_root_buses-v1-0-f8e393c57390@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAv1JytlArrl8REZeoudiSqAji3w0eZ
 2DmAUEmFGjMA4wXCYVdIU0MTNuwr2hpVgbvfOFyV9nIdPUcwtGPp6BY9RkuvijrYQatIuNC939
 su/f9ABjl6/xhAAAA
X-Change-ID: 20260508-priv_root_buses-0263ef2679ad
To: Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>
Cc: Yinghai Lu <yinghai@kernel.org>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        Gerd Bayer <gbayer@linux.ibm.com>
X-Mailer: b4 0.14.3
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: BhW0i5iCtwRYcCsYhKF1TLTEACXv-Cab
X-Authority-Analysis: v=2.4 cv=RemgzVtv c=1 sm=1 tr=0 ts=6a072c24 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=bC-a23v3AAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=3TEdfphp4t-7w4sqoLwA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: b_iyl63R7uRxWrlAjKplQflIOIoOa8Gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE0MyBTYWx0ZWRfX5lRW9LSZwXbw
 5DmQmgWZLmEcf0d1PjSDDl0zFQGVRV8b0nwaU92OLakcli5f8x6KAN5xqitcTW0qp6aemQsBops
 a/S0t9NsynbCGPow9aQ/veAC86+piUom6Okaw345o4J3QFSEm5JuxK3K2HtXcdWGXf2eMqFXHsi
 HTbp+tlQ8jJGYnl5mMCErBUmHRKiLKA4TrsOItR0AB7JC1nqk2m9Ap18w47o+ah2v8wWEOSlQ37
 PjPwXqJrz+tcP02lT4vxAEYwcd76SDX0IuN1ldo+jamTwHSjWH4pwGRLerjAg+x3HUnNDF6bpW9
 RxsS0smz5JxyvL1NGw0wrmv9cuMY/8lmQc3mJ5Y/AqVxvEWbam86Iu58739vi6qBaVZT6h+82kS
 +cMPP+BrBtFbxrPzq3oJ/k8RUY1d4liuOb2Vf427Xjn8WQkSZDWUVotXBEiECzFmdlbdpBGG4CL
 9rlTXdY/YkTgDlm1UxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_152302_998362_0DC4292A 
X-CRM114-Status: GOOD (  12.79  )
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

Hi all!

The ominous warning about pci_root_buses in drivers/pci/probe.c caught
my attention. Looking closer, I found that there are uses in four
arch-specific files left before we can stop exposing that symbol outside
of drivers/pci.

Finish off the job that Yinghai Lu started in 2013 - see
https://msgid.link/1359265003-16166-23-git-send-email-yinghai@kernel.org/

The entire series has been compile-tested only - with defconfigs on
alpha, arm, powerpc, and x86.

Signed-off-by: Gerd Bayer <gbayer@linux.ibm.com>
---
Gerd Bayer (5):
      alpha/pci: Use official API to iterate over PCI buses
      arm/pci: Use official API to iterate over PCI buses
      powerpc/pci: Use official API to iterate over PCI buses
      x86/pci: Use official API to iterate over PCI buses
      PCI: Make pci_root_buses private to PCI core

 arch/alpha/kernel/pci.c          |  4 ++--
 arch/arm/kernel/bios32.c         |  4 ++--
 arch/powerpc/kernel/pci-common.c |  7 ++++---
 arch/powerpc/kernel/pci_64.c     |  4 ++--
 arch/x86/pci/i386.c              | 14 ++++++++------
 drivers/pci/pci.h                |  3 +++
 drivers/pci/probe.c              |  2 --
 include/linux/pci.h              |  4 ----
 8 files changed, 21 insertions(+), 21 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260508-priv_root_buses-0263ef2679ad

Best regards,
-- 
Gerd Bayer <gbayer@linux.ibm.com>


