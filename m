Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEB8CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J231KC1aQjcmbD3JTm3vSADLUXjToGVijXU/j/EQC4Y=; b=XWIwtOCR2lrqKd8lOEIfbwFwFk
	WXjgCVtyvvL2XDuqjm4zBzm0vO/KevFQy8FWsBfEmY9Lw9q2DggmRXmEdKvZNf2T22mh7KAk7zq1u
	1SGc01bncQuqmQRrgCywjSfzBxiid3xNa+SF2tsegjrCq86x/9IQE9U6jTHZdK00HqhCjDlUDO77P
	DrqB5HygO25bV2ERosiW3H1fk+MimUwiUiyWvNmYOigRQWd1eqIr81bPxoLkss7puJmFxGoSvgH/p
	rsnZDr45nh0K6k7hbXPUWf5VxURs6Pj89oQ/7kooBKDGCjqSQdl95vQ4XG/w/1+pvukelRlYEHmc+
	M34wxKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdEZ-00000009HJ8-3XJK;
	Thu, 11 Jun 2026 11:06:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdEX-00000009HIY-3imq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:06:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0tGi304004
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J231KC1aQjcmbD3JTm3vSADLUXjToGVijXU
	/j/EQC4Y=; b=O0dYYf+nBPnmVAdfVjkHTGXsA8uXijN6gEWkH3BGAgzrwhl/fQW
	WZImp7ezDN5r+ULQKDP3zPvoVcpdhjmmAg8PDNoe79UMR/rUgpMCgHwAVbRv+F19
	c3RGNupYCB3nNTr0Mn51+514deEeJv/DI4/kTwGzr1NBGge8plP4zxAwAEVTOdw1
	AsaGdL+gdEWlfVJ8acnBb2u6gL01G7IU6fkNRQjhn1ozZ/b7fkCCNIlFMucWrKET
	a6AcE4ZY5jfw9AQNqOvMao5c6PjWLfp+94hxdiRUDW3XO0yxEbGM/bCdRHQ5/Riz
	dL35Y3D1sooqQZCa464zWQD8kYjpiCBjMPg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gcbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:06:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso833250137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175960; x=1781780760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J231KC1aQjcmbD3JTm3vSADLUXjToGVijXU/j/EQC4Y=;
        b=EheANkQP4+pqFkrqbRxaVIBdZnIOJZecLzRo97P/hDT1ynm1RpzD1qXaRpkhV9nWs4
         3/Qn7/G0B6nwttqpzyebOv3Prfs6Z7M1y/RZgiFMZPjjS59MLOsdA4Rc7ujjFO4bUY20
         o/V7mZ16tlxcFwJYboso0bxjOd1RnIBT59YhJOWfuq04Q3ba9JYClG72+PgdhYXqYeJb
         RO3ldZRCbDlwzue6mKt4+L+GdkWRY/0z+spqMkDyohxeDDX9d/oBcVlFqQ7WmtfYY3a+
         xd5d7KAgV/GCUIp29wQ4AUWi8+DSDSHNrBk56t+/W/E9CZQ7D1/wJb78A2DCi8xzcnq4
         auzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175960; x=1781780760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J231KC1aQjcmbD3JTm3vSADLUXjToGVijXU/j/EQC4Y=;
        b=UO2NYcyNkNYtk9PurRC/FUZ4Ez7bD0XhXtWRNOiA9CO0FWLhJ+VUeaGx6FiqmPzr/w
         ml/0AQ+bmuRU5f1YvfhB1qpQ3/U8l1ZyPyPDhpDOYiaM3zRXvqHxxqmpv/YDl1AlI5xn
         KizeEW2v9mpEXU1jhHBb/8vzwBq0sPaXuFFQm+/9auJsZPc9JYX0qh6Lf+HEAkkXR5fz
         kR5a3zGHThhT2nlJuV964YrSp+PSav70uq4+0C/zrOzPkwFBACaCtaUC44/srIhLW3XB
         dExhuwKEmbR9g/fIIT93J/am4auarqNepXBMbFX8sHHp8aw136SbXUW12gqr9ssnymDf
         IUNA==
X-Forwarded-Encrypted: i=1; AFNElJ9Wk4S6KF4fUZSUGThbk1OeiiL22Gs9u58Ob9R/69ac6ZcFE/sEvYxqBro09nNUS/cA5ssTNNy90fTxkUfY73Fn@lists.infradead.org
X-Gm-Message-State: AOJu0YynHRlAOPd7d3BAApKSkYPvCFA0K1mBqXNksuzpRJLnBsXlK9+l
	ZCGlJ3nYA0eRNs/QfXuddbBKP15Nj8BNet8xu7rFz0Tk/FlQ9PflRshJc3DFuzX1nhnP/ZVP9Wl
	xmLhl+o4LbZRmuJU1YyhaUhpxeWzgYxXmk+KdwgBl+OTdOWm9B0BhAGzX0xgv4SXyLaD1/doiFY
	NIPITX9ultvQ==
X-Gm-Gg: Acq92OFVfVtBaw9iWWMzFg4dMjBVyobCcRXMNes0nwDkZbCt1AG7KfDLQ0ZAG9jHh28
	uN8LmT/VHAZ9A3vIsDNri9HVbu/WDblSc9COKwLfmc9XqueFmz5BkJ9cJO7XQ9udietnBFEy/PN
	XajCY5ygtzIQoE4xT1GXHKB+zY8lTXD9pQ1stcvsDXZQHDGb7z/LuKFHr+hQ1g6F0XyH/9iv5C0
	ilTU93tBDw8Ysnio2IruVBA8scZM6738DZozoMlH3OaYQwG4eVDw9UX4mILDc0eNvCj9lucjUIk
	qGQALDrG/89tqj7iSFWWUiMcwoQh/eMcVOfMbGx8zFe254HDyI2CAqyy9Owy1dy86cs1IunBP9b
	1xTJiD0PoJ8gf+KZ93AHKu+WAMkq0TaRdoSqRJNL37o9r1tLp9bAJdq/nB4aIvYy6bUiRF8sHC4
	t4CMgWEkKN7JhruA==
X-Received: by 2002:a05:6102:374c:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-71d5ebb6737mr666493137.17.1781175959854;
        Thu, 11 Jun 2026 04:05:59 -0700 (PDT)
X-Received: by 2002:a05:6102:374c:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-71d5ebb6737mr666441137.17.1781175959414;
        Thu, 11 Jun 2026 04:05:59 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3991ad92752sm3687631fa.30.2026.06.11.04.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:05:58 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.1-rc8
Date: Thu, 11 Jun 2026 13:05:57 +0200
Message-ID: <20260611110557.120619-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX4ATxcFa5/Tui
 s/WKjGNd8GaNFsuVMSxtTPMrksLFr4tBkaKDzsejXmkQf1cVqa5LMPaKTyvM2LOIBQx0rxZ9RBw
 IUkK/227rS0ayW4Isu5CIT9Ptqfq0QDb5G9IAZwZoCKCECIjNDM2NbME6yyTnrmc5PG/VMrC/up
 qwRa0JW/2fv8wxAv49wq9mlMIIF2fc7BWnPhwafazcKPzZ679zlAFx8cV6j6mZCF6qpxce1EKzd
 3bv4UFyJJLmKL+qVmXR0tmTZH+TliViooq/Hxbv9b80dbKEqOG+UdLAVXbPaEfFdyy/SawKggdF
 3fYk48xw64SgU8aaFQtx4MYbmZb0A1U6Xc13caf1WFYXzv2xb96PgP0/RR2FHuYc98SNTAjyqC0
 Se/e4QqHHpTXnmKyIvV1u7bbpu2kkSUREXHhDlmoAXlYjqZRPD6dDZeKbw9bRF1BVxT1Q4UG+7s
 llNbMAd2lynWivbaINA==
X-Proofpoint-ORIG-GUID: WnKjbB3_2ya6zBnUebVErhQMa-Z1t_Pp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX5adBgMI+q0yi
 R7O2abwbRgxrO5P/uOIs5lOJFag3H27i97Rm4hdVT/WZ3Vzy07KuxjnwqDKomqKZb2F61Z09CsE
 iZGMRGQ/zczaOCEbFHVohqLT+lpXMrQ=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9698 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=TUf28JeNPSodCt3kalAA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: WnKjbB3_2ya6zBnUebVErhQMa-Z1t_Pp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_040602_041817_3F9EEC4F 
X-CRM114-Status: GOOD (  11.93  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v7.1-rc8.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1-rc3

for you to fetch changes up to fba0510cd62666951dcc0221527edc0c47ae6599:

  pmdomain: imx: fix OF node refcount (2026-06-03 11:49:37 +0200)

----------------------------------------------------------------
pmdomain providers:
 - imx: Fix OF node refcount
 - ti: Fix wakeup configuration for parent devices of wakeup sources

----------------------------------------------------------------
Bartosz Golaszewski (1):
      pmdomain: imx: fix OF node refcount

Kendall Willis (1):
      pmdomain: ti_sci: add wakeup constraint to parent devices of wakeup source

 drivers/pmdomain/imx/gpc.c              | 2 +-
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

