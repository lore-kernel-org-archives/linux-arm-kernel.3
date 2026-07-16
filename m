Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2A0C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PjP79q3s+ptBA1TNA/wMMy2FKxZZvdgtZioY7TXIFA=; b=3TFj8K8T6Ym5A5cIGj/P4+uFKx
	v7zn7BC4MhXR9V/m6eEEcRh7p9K9xwdtVh2DlmdxM1LkfhddXF5FdQbcjtLOZkiVhKbWrFSinZETt
	1A/tY9cA382cxE2z4vExL3kBDLvtGk6DDMCfaYvwS+TgGN0+lwLIuOEizVNPtA9z6Y4sDABb0pFLq
	Dy1KN9rX0gsGflAi5gI19Pf3CK0M+sWqNOzIn3BrQqPkbkwSKPs5u9FjK6JB8p9XtqXDAFURPwW3p
	P9EeSCWdIMg3vfLPa7JcjUPUwfMg7MR7FPvVhGUoJzcYkqDWPLYCdAMLmpHgHQZIIVGZHieZmrF2S
	w9WlXUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLUC-0000000HL3l-2sZn;
	Thu, 16 Jul 2026 12:46:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLU9-0000000HL37-3sSC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:46:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiMt22637093
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 12:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0PjP79q3s+ptBA1TNA/wMMy2FKxZZvdgtZi
	oY7TXIFA=; b=Bl9KMvIZ8VetlpS7N0qpux8TqdeFYagH5584HTBM6ANLQxMH5TT
	AGJ5kBzxH2ZgSf0HKfIA2g8V/kyrLlN3a3ahFp5qZmFDi4KIA3DVHIa+B19FwSIb
	q4lCYRogsFmJOBfgYaA1qF0Aeqfo/TxMq6Ho3HUsH3YJK3kPgOCvqhZKlm0UHSgx
	nqqQBjUt5NP+FMOHVMy8IWL16I4QP3VvJYp2S0QTndVZR8F7BlDZopAaZbhMS2v7
	Xg11D+PaNsLLMN38hOJyigZRX4mIxqFLpHASvBfVDhkqbmUUs3CdKWRtLgQYgRop
	CoMM2m1h6PWrJZ7w5EwWBl9D1aL2k5S4RTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex14m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 12:46:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso149198581cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205999; x=1784810799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PjP79q3s+ptBA1TNA/wMMy2FKxZZvdgtZioY7TXIFA=;
        b=Zi0vXpQhg+KDIGPy7h5rOG4d3qRTdIyPHp6lFsOc0cnQsoFOspgC1DlmZmrrJ4a0Wb
         5NSLNdhMBd5vOd9PBKhEmfCFI8mkjMVQ327vB5mQCjvOITQatjBBKzPu3QSRgZ+ao6d3
         jLUKeq3nAcppMIT3Fr2XoLfbCSoBpPgOUFOvoVnLZYHo4dQnax5hPpwgdcqI97ZtIfyN
         SMeLE81l+xZdX5m1bIMlMmxiYNgBusMd7aakNrBkSnjqmOjXPQ+14ramoJcNXglK5dNG
         mJ2NJZ4JZujjatESUdh3oZuHcVaqQH6/mMJn2jCPJArf/fCV+lpRkEKsjJI4Jm33D14T
         oRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205999; x=1784810799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PjP79q3s+ptBA1TNA/wMMy2FKxZZvdgtZioY7TXIFA=;
        b=ImKt4XfYkV5QXxaeoS8rKrA37M2sov+ldbt0A+z6A8HJwNoR9UOWj8IL+aTh4sPGxc
         zf2SERz6rJ1nOco/xF22/YRNJiQCjrtLdP6FW0KRvvNsmJzsCPK55ZwJlf5UhdMYBXVS
         FcObDT8pd6GvNsobSHp0KToFOy2F9OPUpoOT0c65n1eXneUBDZxYKR361kN2K1OOyH0C
         E3iQLxDQ85N3DcfW56pJQeh6H0C9QL6ToIJRLB7GPtAxVHBrEpFY9U8C8McktZKZN5gf
         XQixLzaGUZ3Q7SSEMvH30PfdzdPY2+oEivF6j9acQoa/+yqbeFbqKh/NS+LW7f6XetQ8
         Botg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd5xLpC3jo40QTYInLzsaEzfJ20s072y//ObSKJCrbnOPxCVqYGGyU0oWS03ydjFjSd9gf6ovBstub+Q2x9PwG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvfz+JN/NiQ9ZGRCqfaZpwNHCHQuhtaarSz7NuJom8nKG9dtw0
	JX7hQYLPh++TQffwZuLqReux7RR6dRQKxaa7qFbWWfnpuQXDThXA2jFNhyJeTzVgwiXOtVfTrta
	MlrZp+iABXJvXfQHt33uNmFIAmRd0A4w8hEk3+ZDXvEnzyUCOak8KbhYWtDNNyWxTq9npetV7nF
	w/iMl73/DPRQ==
X-Gm-Gg: AfdE7clErWPACTtd2QhwgkwAco7nxVWGj+qL8El4OJ7yuxlSH81tGpR1drzzvQrkZps
	cAp62G/kZAXam+WiR6QXCOyIPA2aTcslWpMjqQaSkccqQONduyyH4PzkXDi25Y72o9C15sKNTkA
	RKaiYezdav3dmlEkdr5okI/Wn5uuXUk1Ndx6o5FyFK2MdxolIz4NPLbwXXA6JMFBx9fi2Y/2v/c
	trQ9DEJQeEIjv7mRGXhMq4G0S3cfj7vEZghyuv8X4iR5LUKJKfNzCwiBl3q4dQMRm4DZTHSC2iP
	ESHUFYaNOvfr+IzASrDH+f5z/2/bqmwxvTgvpgbuE2RnggLL5Kr2PFJvWx6g6bFQmp4QPG2orAW
	l5kSuTwjeorXWhxfddGNKYtj6Z6n2f7OSNfCViuwp26c5XsXggWYaCuMKXg==
X-Received: by 2002:ac8:7f92:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51e424dc615mr112099021cf.65.1784205999111;
        Thu, 16 Jul 2026 05:46:39 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51e424dc615mr112098701cf.65.1784205998665;
        Thu, 16 Jul 2026 05:46:38 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b9382esm44428681fa.29.2026.07.16.05.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:46:37 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.2-rc4
Date: Thu, 16 Jul 2026 14:46:35 +0200
Message-ID: <20260716124635.45302-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58d2b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=Yz0eIgJFi14MpISRoE8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: K9ZqccsaAkS4JYK6RALcFOYeUwi2dKxY
X-Proofpoint-GUID: K9ZqccsaAkS4JYK6RALcFOYeUwi2dKxY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzMSBTYWx0ZWRfX2u2HyrlhOeUZ
 pgK7wEvUih3i/yr0bbmZO0WCnUyY8QTWdk6S208MkFxmRYMOgadG73xabZXAUPnRrmkzud3XKPn
 24G3Lma3z3jhQs3y2ESp/VkVkL3LJsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzMSBTYWx0ZWRfXwkZTooOEpEm6
 2X1nsL6a7DqwOGtJ2bcEzc2jldyaz4P5DobqSw/bNN7A36LpnHOSYN81J8GI768aOYNipXjTbVK
 XmGDAkmgmm/zjSrVkXgUOXaDNbZI0VYE1WHicrM+SU8LpVtdd1rQaMqu+h7pZmR/6KEIK3t1bJi
 pkUx49TrZrL0Rtc9DMPfqkqq4Uuhn1DuGY8xZyTDn4P3C+/ij1hAeUgdNSZ0wzJYjXJEfn+KtNB
 W2a4j1TYG5teSpMmANOZi3pEXOHYia7Wxw73EpZmHru8gqd9fN/q72iVKAolLzjyJIJNW74TMC7
 u8/bqOO5yxLu9L23zJbKKJ+869VRFQg0UkIhC0qbVC3wM8HvtJVpDDsoSLAuKWCW3tBrSAjk32U
 FuRDvOm+z7KUv+x5xhs7rEnX6tka+HmhhHvriWJNxjJ816FcQXJcEpZ5BtivTN/RSWeyVe77DId
 YA4ANvQGl++8vEQP32w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054642_079223_8755BC8E 
X-CRM114-Status: GOOD (  11.83  )
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

Hi Linus,

Here's a pull-request with a couple of pmdomain fixes intended for v7.2-rc4.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2-rc2

for you to fetch changes up to a4876f11aa1d076802676e23f8af500706e780e3:

  pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check (2026-07-13 12:42:17 +0200)

----------------------------------------------------------------
pmdomain providers:
 - imx: Assign child domains for imx93 to prevent power off when in use
 - imx: Fix i.MX8MP power up sequences
 - mediatek: Fix possible nullptr in HWV cleanup/on-check

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check

Guoniu Zhou (2):
      dt-bindings: power: imx93: Add MIPI PHY power domain
      pmdomain: imx93-blk-ctrl: Extract PHY as shared domain for DSI/CSI

Peng Fan (2):
      pmdomain: imx: Fix i.MX8MP power notifier
      pmdomain: imx: Fix i.MX8MP VC8000E power up sequence

 drivers/pmdomain/imx/imx8m-blk-ctrl.c       | 46 +++++++++++++++++++++-
 drivers/pmdomain/imx/imx93-blk-ctrl.c       | 60 ++++++++++++++++++++++++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.c  | 40 +++++++++++++++----
 include/dt-bindings/power/fsl,imx93-power.h |  1 +
 4 files changed, 136 insertions(+), 11 deletions(-)

