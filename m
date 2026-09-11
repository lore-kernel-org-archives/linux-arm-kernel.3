Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C76C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ui4rNKQkTeU5PMMBYKL/mLUgy1+10rfQEnY+sjASKno=; b=Ubn+KXqi9ResP8
	h3x6H4j/NceAr6zHGjOL/1BJZGHT8TG+BXm6tJf7r6WEioz0K7NhKqnqCMB6EG1lxk5p+vzcj0A6R
	9M2MRlj+skYL7ikBSh6EBW9p3LbA5NvYfEx+kdEDp97K3/YQrNYzKVXQvZepxCAlhPiVGxP3qkQwt
	90HtW50a3dhycBCf3sE2/e1ZrXOWkWJ6oaIBH2t1m3GD8uSpYWGaqU0YZXvf2EsW+7qoX+Vtn3Ksx
	viroEwjwS2dD+HP0C6/+LWQQabvehbdqhPQvhcFZgM2c4epp0x1yDNR+8wYIoMlQlMVyTwTNYhStC
	AhaFYB1IhHN2bawuvx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x5v-0000000GCMZ-3Jr1;
	Fri, 11 Sep 2026 08:58:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x5t-0000000GCLg-2Mon
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:58:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7ktEl3017494
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ui4rNKQkTeU5PMMBYKL/mL
	Ugy1+10rfQEnY+sjASKno=; b=kYkyBXbUXjDVDzwQ0hNq0cPpu2e83DLBxo5/kV
	fAKa64PdEH6np8oR2r1ZmrzdLLbHg15p30738+PjX1O7T7LrCgW4rTv+yIW42lFO
	USX8mrMH84RH6bbZM/UUZt2H6+/91CLhNwp+Xxnazoqi3Yp6IHvjDnpB4MPFaBcj
	XSEGliLB4lcpPA7+TSI5aSXBtkjv5fQetu1t3HljFQIz9/t7qD2mIGzjmvIFpfBM
	QRwqA/MKDNF6t/jaKMRPINnxTTByCCsrpFTYO1E2GFAtq53dq/AEMbkC+iC/djBr
	ubevLN095l1UQwZuOTiA6DwDW57ipviCZOtxeNFD1M7U4SNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx4bf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:58:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939694871aaso106324185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117128; x=1789721928; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ui4rNKQkTeU5PMMBYKL/mLUgy1+10rfQEnY+sjASKno=;
        b=g30pflvL05ZOD+uJ7+3ANPIC1+oAYQxVTa6TmvOugekFUdiv1Mt7Z1UUvNHcHqV94M
         dm2yN5Qzq/WyEkZ1AAUrJcidKvphWNiE5aAB04vbwMOgsj+QmT/MqhgIoc37EMP/XUrU
         1y4IQNlfNI9ChdtSJ5OKocGYbtdH7HDQCJlxk1mEWkckVVQSNYOsrSBnuLo22JtL7+ku
         W21D2KA3WW8JfqQoeRQjYrvSXTn/6y0KqRMEdTz7pTNhQ0siOozUlK+s3c5rROWr/SJ4
         fPI4IK6lazh2RA+XvAQeXINVrFScMKpKEeOAxUfHV+5F5zif3HRhNSA7GOo2NiD6Tn+I
         brTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117128; x=1789721928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ui4rNKQkTeU5PMMBYKL/mLUgy1+10rfQEnY+sjASKno=;
        b=gyqoAP22BqTSSWs4oCrHFB4T38KOA6N9yXWKdu+yOgtmWwiJGFocjbZrXJ90lMBgao
         bsut0FSDP1LKCgzF4BskWROfjOD4xJ46uVbZjewdWAX6yuv09zdQjg8lWD0I10XxMgk0
         A7f5FrID5z6dfiaeLpnY+aBdmHS/iBodM37YGOGU2fM8epN573PlS0blJGVMxX4DflI1
         IZqtA90A1wyHfKXtBOlbwhhk7SHWBBfjBM3b4r0pozMZL7r6Liy77dlLxnMtsneNVuyC
         0ey4knvC1dH87tBtEn0T+/5fmwhXRc5Ht7kIbYzzb4yjSYhZsQFddaE89SIV2tVk7YDv
         lyiw==
X-Forwarded-Encrypted: i=1; AKwUvBzgF+jL/ukmMNpwg+sGbkf6lWE9xjDZQIB0cNOX3IV/X/m4iN2mxXF+zv4tYxXT/bpdfF9VuE0D/zz6n9AmJlRU@lists.infradead.org
X-Gm-Message-State: AFuF++n7l5KQzyajs7ReKinB22BTYnIJubelGwRwhXbudW0Be8YcY9qv
	11Yl/TiY3cZozjvjoPk9BSSssg+xdK3q8lErv7j8o+3n6LVpVPd1mtJDA4A5rOwwLSPFryzf6hM
	QSdiIEFVhrD++7yT4hRTaGHoDB0/XEdUH4pMihy3Dja3ZO+CdLowogX2N/dLgmYq1LIBktHsvA1
	xWzw==
X-Gm-Gg: AYBFou01SMHb5bKkGZuuhynUpk0i362j1DlgibsOZO5sV5dV2McAq/OxNEeprbSvvCZ
	1WAR2H4wE4Mm1y5RbagVAlp5jKXIOjJnPh/v8aMXZYmXTRo8jiwvHbDu8cc+KcE8xrJmM+Q0t5L
	zQ1Bii73j7KyUlE7ULZjjbR1BHN6uxDEgvmb5h0Ed5tkD1/C5ie2hMGKCMp71s/w21+dzmuB8/a
	VuKyu5y32vQqmm/Mfp6CVbc393SUiSxcYzcvt9pc2GFTOiDq+25pv8lYGpt4ikx3ceksAdbw9jn
	omcLsg5Apds1t4ywBxaBWxlHazRoxdYCcLHwNHTR5YanZk5+1OxeBCQwLdQytybE+pavLnloknU
	JVvcFiNSnRUuQiQ==
X-Received: by 2002:a05:620a:459e:b0:939:9e33:6a63 with SMTP id af79cd13be357-939ea26b020mr367218885a.45.1789117127762;
        Fri, 11 Sep 2026 01:58:47 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:939:9e33:6a63 with SMTP id af79cd13be357-939ea26b020mr367215985a.45.1789117127275;
        Fri, 11 Sep 2026 01:58:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm4455640f8f.28.2026.09.11.01.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:58:46 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v3 0/2] net: stmmac: restore previous state if
 tc_setup_dwmac510_mqprio() fails
Date: Fri, 11 Sep 2026 10:58:28 +0200
Message-Id: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53OwQ6CMAwG4FchO1uzrSjgyfcwhgxWZIljsE3UG
 N7dhZMHL3pp8vdP+vXFAnlDgR2yF/M0m2DckAJuMtb2argQGJ0yk1zuecURQrRWtRDbOlC8jbW
 +p7gTvLbT6I0D8t55GFXsodR5IVWOGjvJ0sHRU2ceK3ZiA0V2TsvehOj8c31gFmv1jzULEECNK
 ESjNeZcHV0I2+mmrq2zdpvGqs3yU6h+EiRwKMWubEpEbFB/EZZleQMvbGZgUgEAAA==
X-Change-ID: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX7UEP0z9UWKde
 aahTVM9+XR5gRlPm8SjmV/jUMlUro01MHsjQMerJfFPUgxswighDIpz3+FOtZFTp+aZ7ULYDrVS
 NkEl23n8jkg9jegJMN7HYNxqhvsB0fRYzKF2TpmfdNbIGgY4n7Aqca3JUkUhNQffZ+7rKew6J5B
 1gDAhclNFMu5k7kRVDDp9USgWvc0xV9gG1YxvUyIvHXFqP1QcOKX5FhVxuV++SXzyirD49rIs6+
 3WdTycSb2+WE93gB25OG7BVERpG85Trk/oYjo6HcMMBcrdPL4uKSLRtUFFuHga1eFpzfyVQohhA
 XxIqGDo0aGMM2/RodbG2oHRFunuTy5O+kc1cJ1u/sn0RcNWduK3bPfKyGmJgz+uz8aXcvwlkWHA
 jLuNEJ77AwOhu2LwFxCXepv0hoiCSUwxaealSwf71zKrwUB3M2cTIE0PaVVCzjzW3x+g5sjbJQ2
 sGLdx3z/LoIo76EpYXA==
X-Proofpoint-ORIG-GUID: MxlX0Tdlf9LCsabdrlf4WOfBOmnhfXyH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX3srUhU5rc69C
 frSzRaMBjTunJqnE/LE2hmSL69UbKiUJn2qK0WUTflJ/IoovUpXTHS6KWUo0vDTVjZKNRSFLlDK
 EsYNzq8IdgpF1p51H+oSZ0ZjxZtRTD0=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3c2c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aTdT7-qauowdluxQhbsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MxlX0Tdlf9LCsabdrlf4WOfBOmnhfXyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015849_645612_2807E166 
X-CRM114-Status: GOOD (  10.94  )
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

Restore previous mqprio qdisc configuration if
tc_setup_dwmac510_mqprio() fails running the following configuration:

  $tc qdisc add dev eth0 root handle 1: mqprio queues 2@0 2@2
  $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P

Propagate FPE preemption-class mapping errors in
tc_setup_dwmac510_mqprio() and tc_taprio_configure().

---
Changes in v3:
- Fix commit message.
- Rebase on top of net main branch.
- Add log in case of netif_set_real_num_tx_queues() failures in
  tc_setup_dwmac510_mqprio() error path.
- Link to v2: https://lore.kernel.org/r/20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com

Changes in v2:
- Move stmmac_fpe_map_preemption_class macro definition in a dedicated
  patch.
- Improve commit message providing a configuration example.
- Link to v1: https://lore.kernel.org/r/20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-v1-1-eb171bdd340a@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: propagate FPE preemption-class mapping errors
      net: stmmac: preserve real_num_tx_queues on mqprio setup failure

 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 99 +++++++++++++++++--------
 2 files changed, 71 insertions(+), 30 deletions(-)
---
base-commit: 78445023439506ebd83b86d40b1e428a3b309d4a
change-id: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


