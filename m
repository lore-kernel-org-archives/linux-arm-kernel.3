Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1801BCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPVTKdZ5Mp0=; b=wQD7gdUsb5SQrUs0vvf64d17jp
	Fiv/xdzWDd0XOvelOJhuMwLyKdm0dgeq5jbfY2+9OOjy9irD7gbAZM1pMmaTr+MCxNiMUHoSZxShA
	BU2OJ6jIKJnFesBsE0ubgAEBSPHJt8v1RpuHKeplD4jQgJCXp9txmOq+x0CkJ6Bsn3mnHM6YqpAlL
	XCsAI74yHw2KpAoPrFi3UmF12lcrBV3tpe/EWEaHHLe9E81t8Jxq/1kvE2CH54ewggzZrJivCQftq
	nt5Rv2eeYYVeqQ1P45rArf1Wl0NTyGFSeDTbfk2/LlXvjt7StCIrGdaZEnkZwr28xsH1JOteTmIaK
	QB1V6WWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9AF-00000006Eom-2lhO;
	Fri, 09 Oct 2026 11:53:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9AC-00000006EoI-42TO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:53:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHSR642387
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 11:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPV
	TKdZ5Mp0=; b=NF/0yA8y72lafuLfRe+aIJVxJwV4iHDwA6XshihHLm0Gfa7fda2
	gHhAthPpb2hG0jsu5b8t7N17UAD79tgft/5qU5A7//1cNGEpXF1syQeQfxk2Bk7i
	G5yoRU53qSynPSQ1aIy8LhNCOjBq7HWgmtNrQRkQtOSZebd9qGkqmaXrYmShCZM6
	KFXofxPNzKHLM8HXneo6uSCg5wFkiTR4/Jb5Rac+DVxyssj/40rJASnA8no/tRyi
	wa5bENRBdOclPa1lTBVbJS6bRIEYb22lHkdM9N4h4jDS4Vpi+JxN+kZDt+3Pmxds
	ZPGw6ElMx5sjYbrMagkuklfo+WeTizRfEFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrudds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:53:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so1064921885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791546803; x=1792151603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPVTKdZ5Mp0=;
        b=fPhrr1/kiG411Q6qx/2hzwZlVEMukyCANGGhFIUeZ4rxh+u2BjU9EVh26BqxvX6yYs
         rK0zQFiBjxorsMmr95cD0ti4fnbwma+6xtedtYHvZuXzS0WGHsVjblH4sDNuW5aQ5ehG
         DNZl0g8b87jWG1ur2UjiCT4pWvK+MgrK7TsEYwon7JQV2AqTzbHn7KyMz3o3acMZ/Uf/
         ic6DpqxbRRF6IvWodlAauHPWXqN6vvnwDmHviudkvV+Po1cnFJ4Dsbje5SQGUhPPNGeA
         +VO7vYfdwTBrg8isMLPtNB3nmvbPl+V7+BK1dIkUfQPAPD27OhVwVV71s/JjkSuQtISR
         T7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546803; x=1792151603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPVTKdZ5Mp0=;
        b=U/sAJRMYG3N1GNrZmQZiM8xSHLVZpUBqmclLxto10CltkEV8E/vbkLrA2ML6o5RTNN
         gCnn8a9LOsrzcrki+ldaBCEWc2ND+FCe7flLtF3E9U2/cMg3liVH1rQWyXHBb3V7sP+Y
         Cqo9ve7r1465ac8b5tyWdKSARB/7eH7PH7C1JSTRMVVvHymwV+UjIuh7U3H4pLTD4bVQ
         HnhF2kNazM2m7us14oi0+c4ry331XGdIqOdzz+59onr3RoWHSVdiSE/+MAeeeyDctOXx
         mV3wpESHKPiggjPwmG2QAhzYSXJYFtU9zhBrKCFssmivPwJiRCU2bnhyzU5TMislIkeL
         SKpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxKsF7cD1iuJRUpX8JkezPIzE+4JSq6zzF+qnm9v6EacwhkPHW3KuiFvwaHRo9y2lsl8BiO6eu2c9cIrU3wtLG@lists.infradead.org
X-Gm-Message-State: AFuF++kI09d3DXdlZiRF18+AKMfJC9Gz0ZLo2vuJ1+fS5ztsMfKDMliO
	IO6Bx3ISxbyC82/MuQ9MdRvCjJ2Lbtx9SROJ0dGxuTocUc/YS/oGc0ru8Xf/UCW8uiUVnTfsPDn
	pz1ukbGRjPBREe/NvzFqkMKPH3+bQ20FNijUcDKl6CGOIqqwmHJ4uyrW5YiyAFM6TJ1ncO7ppkl
	nsc9zQ+ZU5fA==
X-Gm-Gg: AYBFou0dT6zg1sd6+pObG+sWV6/1K93kJVD+olAmsrM7yzjKoZdABqnXwtHklcEJhlV
	LQRnx7xWIsDscfxcrYK2x7oTsBzTmKWsUzUkGuMGXsyYHxTiFsTi/J2eXtVHlOiGEowignIUtTm
	WSsHUkSZUAUOSv6+is1z6n0BRlNwU9sNjoZosWJHw2zNDIzhRnINiIusOIt7FlU5PH4s/3p4Aq0
	qccuc148/Ij3lNmbnIvgjXjoLiE/bA5upuO7STuKDpL+OhqdLyCMQixCI+usB1uh/McixOz6R34
	lUR4s6L37UDI0QJQdGT5YV6qzyw7PtxPOseAz7EVq8Sv6knxeNEjy/Td/BYnbZtC8ZjE+2glg6E
	SXlxuk3vbAXu0wjGOxlwO4spFoPNa0kVk3HZwu1Kzz69BvzmPcl1PraDBRA==
X-Received: by 2002:a05:620a:3711:b0:93e:9292:1bb0 with SMTP id af79cd13be357-93ebd0c08e9mr211379385a.3.1791546803138;
        Fri, 09 Oct 2026 04:53:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:9292:1bb0 with SMTP id af79cd13be357-93ebd0c08e9mr211376785a.3.1791546802609;
        Fri, 09 Oct 2026 04:53:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a7cfd8sm83244166b.44.2026.10.09.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:53:21 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.3-rc7
Date: Fri,  9 Oct 2026 13:53:17 +0200
Message-ID: <20261009115317.14472-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8d5b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=0s-mVxdY99Q0NorlSv0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: d_ZwapmDZ21K_GWoBKHh6zC-87KL1Gu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX22xkH8VsDf3k
 v31lT258hsPyPihfFLfjLXb/jT1WFPXZ100ikAiyFHG+C65ME83S2NUT8RvZkHuBefz9Cuc8dCq
 UvjSFbFylEII+y4nUpDudVfU9JM5asrYmBWgCRdvCrogh7GD5Radi3cm2ae4OM0Fe6LVjJc0WZd
 oLIUKr1a37gHcEEddpnI6AOKxPzIAtRORGGjsmkQOHuC8IMYU50gLYjVPsum2WEs32hFbBW6UvU
 bFaD6FBvn4nzTBKm9yIteH3vR6LtfpbMmF62kEHDfYtiB0mIWw8AUA8RkPTg/oDal3PGlU1hvw0
 CdZbUDYA6fzP9OtQG5hPvOhQZCz3mD91/NRGIq0VVbS+VGCpzTeJz1hFdGFTmCCEqNRaeBQhY4i
 Y8Bwk1nL4y30KPRxAgyJHiWHgId5VmnuXT62FnwY9CiNrKjwXivFPLwxg/IeuCOp2hVWX5nwnRt
 OLlil5sO/VxLZZxSPXw==
X-Proofpoint-ORIG-GUID: d_ZwapmDZ21K_GWoBKHh6zC-87KL1Gu2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX0WYncg1E5mqQ
 MrXkXhc8mBcopEtuApQerSuWX4zdr3WiACA+/0eSshxOetD3UJi7hqE6C4ZcxLcx98UNI867v7c
 rqJYLxfIyX2ofYlruSvGs+fgabSmIzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_045325_003934_9BE8378A 
X-CRM114-Status: GOOD (  11.12  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v7.3-rc7.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc2

for you to fetch changes up to 4c66c423593e26273ea0d644906ed007630c6f6d:

  pmdomain: rockchip: don't ignore clock lookup errors on attach (2026-09-28 15:36:50 +0200)

----------------------------------------------------------------
pmdomain providers:
 - imx: Serialize power on/off across sibling domains for imx8m-blk-ctrl
 - rockchip: Fix a couple of errors during probe

----------------------------------------------------------------
Ming Qian (1):
      pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains

Shawn Lin (3):
      pmdomain: rockchip: propagate subdomain add errors
      pmdomain: rockchip: fix clock leak on domain probe failure
      pmdomain: rockchip: don't ignore clock lookup errors on attach

 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 15 +++++++++++++++
 drivers/pmdomain/rockchip/pm-domains.c | 20 +++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

