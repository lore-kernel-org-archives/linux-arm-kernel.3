Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD6C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BdfDsmhndmGDUsGcNyFXNm18FkaVS/nttiWoZOC0wt8=; b=G77z48PfW6nIlD
	iXnVE8fUNdovuwPa1V/RkyJnKfOh8Yscp8lWC8+KHQCFiL+R7BIDJ0Ext8tvxG8u+IPYveUJPwFw+
	bjMnqDaMKQgkE1VOk5lA6iw5O0akUr22s87jhqAGJV2yodNxBZ6LhXV2XMjXelujSs6MEXzZIQhPG
	LBuM51R18q2pxEu+HE55jClBstn88UIk/PAagiGsPzrE9ISfCtfqp3cl3g3NEIy/XCGPbZQOngdlA
	viRu7TN2dz6ZC4J+u2XDK7ygt6uOSCJKFEw/c3WhmWxWEDk7dhLfK68yq+Ns258n7EYcLeKnqriup
	IhyCEiG1nSp3dHVaKn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ERV-00000006rKo-1QvH;
	Sat, 29 Aug 2026 08:29:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ERJ-00000006rH6-0Gz2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 08:29:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T802aw1353069
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BdfDsmhndmGDUsGcNyFXNm
	18FkaVS/nttiWoZOC0wt8=; b=l6B/P2VVuKZDlj4RHslFK4PzRy7HiznGq7me+/
	nZB3HLGWacUCWlRiNq3p+xrosx7O0h1y140hSbwngEP8TM/n/bm5Qb0FBaTqCZGY
	9aaQGjqL+7DTvEr5Dcg4C4fOWLrypDZjXXRr6r8fk2DMXt0DULwjyBl+FAn9fsdV
	2hz1YmoAaMrTCy0PrHk/dszj3h2N6aMZNdKf/cD00cRooJRc7R9QTdFKf6HmbdaM
	nhWzWJzD/EMcNuVj0HnOt3wBGEIT0vPXQWHekzPkX0A2ocOU/eVu+HvDiyD6uh3M
	pdC82Z1uHqtnYZCUYA8YymnT9cDDG6uIPeF9YHFT975e0E0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhw8h2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:29:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7db8d191so3734006d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787992160; x=1788596960; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BdfDsmhndmGDUsGcNyFXNm18FkaVS/nttiWoZOC0wt8=;
        b=jPDBRLFVr6IWIeR8jf+nyGQ9xSYSE3pJJXOxsLxm8TSNfXBuxlwP7yxWoMmHC2Uh87
         FKoOJfcUjiaC2RShnPHQ6NJ/+3LQw82VJ6CtkqbvQIrL47x30MD8I9pPSM/bWaTIjyJO
         cJSxz1H/PhxZx6Z9Cej+VUOZ025VU9BTYl4LYU2JmNwTYD5+Mh7SVIRqbij7paVGRIjZ
         O1ZEAmcK0mdNt2jb9HW9fmp6lyJl2iYhZ3wO0s45/3Fm+iNmBZPEAfLT87P40ial5Mio
         x1pU2YaZZ9yGGjE9mns+ZLJYHaIEm49mj7S9N4nn2KEhfM1JcaoNcWPE067gIXGIjIjV
         haHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787992160; x=1788596960;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BdfDsmhndmGDUsGcNyFXNm18FkaVS/nttiWoZOC0wt8=;
        b=GxhITBMYXWIMsC0HwyLLMI8xcl1nYAsOjVpCkba3BCS1WFL7Mg3561K1j2ipjvKo+O
         0WZz5P91or3t/1ZHmzRWZXa01l8oAcpcA2OMpGf6rUy7QWkhVVAKZ6EGVlFGBF0LngGm
         3UfQkBaf3XaIyAVh19bS/IWybotbXwUpyezHW1eWhSD4jjYoTEqjaucpIx+rwXItSEqY
         f554n97tFZdiknNiT1spARAFz4aIpH6fMTar1u0u27VhtuEZWTA4BT0Wb4nL7At7RKyG
         MQe0B2KEsj+qEt3mp9Fad2cj4AfjpX6PXVuYcz9Ys9i9D8MBxoDP35SxhbWTdMZ+BJrz
         98tg==
X-Forwarded-Encrypted: i=1; AHgh+RrV/2ZjdjDsuqmz1yED8lnIybQk6rRzHSOD74325d25Hj15mqe6M7+bgYti8huTinxv0ECzHQJBedPWEZO2ME0G@lists.infradead.org
X-Gm-Message-State: AFuF++ldAh+nUmAubMAhb5tbuym5KOkPXt1i177TXnZBjy57c5KvUJP8
	sFrozrz2AHvRv7BeJRn/EUZOQj44ij/ea48okBwfqK2Xw2KSyaCe61qQqwixoYvcS11mjkX1Utc
	Ueu62kj6dtADDvx00Jwxdakv0oDraq8AKVsULNAR+yw7mo9hhj3ioTK0TSrdTSknL+nCe1xSBB8
	n/jw==
X-Gm-Gg: AR+sD11bwNUKDXQqNgWo30KsNPHcoHIGlx7/KA83uzXX2K1TOF53wQU8bH1nhDlbaJs
	wDWIoiUqxygT+80YadyVI2tkbeuFPOwpjWoMK//2EC/JrMcrcHswUb2nhB1DfBBHmsFKtrGF63y
	oKWg0H7s+ayD1W2sMk8XNanqxe8iYQ9efjzRgLTiNT7BfQEYDqAJ2uIyG8Yr2rGXS+hELEkRyIk
	+/jfpPb6Bf0KXsmhViYQrKOIN6F2Ei9jPmMAqV0msPsh7g8QXfwPMFwIdRJnxcYZpjDLc9Fi9N5
	eK+6HWSn6v7jy8zZfEpP7B0OUjKAIk6w7xAShZnpQ2Dey4e9mMCRl98HUZ/UxxNbaXD6nUUmmhG
	9XhZFA3oQtop6zQ==
X-Received: by 2002:a05:622a:1308:b0:52d:844c:b0c2 with SMTP id d75a77b69052e-52fb9429883mr141020411cf.12.1787992160571;
        Sat, 29 Aug 2026 01:29:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:52d:844c:b0c2 with SMTP id d75a77b69052e-52fb9429883mr141020171cf.12.1787992160140;
        Sat, 29 Aug 2026 01:29:20 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm72533635e9.5.2026.08.29.01.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 01:29:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net 0/2] net: stmmac: fix qdisc configuration overwrite
 during qdisc_graft().
Date: Sat, 29 Aug 2026 10:28:48 +0200
Message-Id: <20260829-stmmac-fix-graft-overwrite-v1-0-a4f84c4c264e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDsQR6jVq0gXIfm1szDKJNiCe
 HdDlx883kkZpsg0NicZDs26pYr20VD4+LSANVaTOHm6l/Scy7r6wLP+eDE/F94O2Ne0gGOHIOg
 lDq6lOtgNNfvPJ0oo9L6uG1FlpjxxAAAA
X-Change-ID: 20260827-stmmac-fix-graft-overwrite-d3ec2e72d901
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
X-Proofpoint-GUID: uNhJF1-z3AUBI-gmX7fxWW0PDhln1DOw
X-Proofpoint-ORIG-GUID: uNhJF1-z3AUBI-gmX7fxWW0PDhln1DOw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3MiBTYWx0ZWRfX0tFHWQ/rYFpQ
 fNwDNXnnAmD1vdPoBbZESxKtfxjww6DJ2bPOHRtcvyjS942LmDyG9L8KG8PAsL+2TdkddOYuZP1
 e9kQdWwR9lP+FIYFPc7lLscPLDankQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3MiBTYWx0ZWRfXztX+bV2BPlpP
 UIMbZekYRFiW7pRQRr/DnK/4upZ5DveLcJWhlOmipyy0kXerfSgxsjengxc8y6IzIMm5W9ixBTM
 UMPxlzqNkDFMe88IawJw9qEerkyl55oxZcagAjLaXTO+oeach2/cD1zH1925erj57ohAStLqDt8
 n2amr6JTgEtj16R3Z+gEIwo+rMRsYdnan5jmPDUwxftGd+qYbtKS1lEhOMaaQ4J3dG17CeURwaO
 CrPUUPHL21aXw2TPmFOObpw8IeyuIH4OYUvGEn6wdOdrMYFJuYubX1RKDpTAebJq+V33QQThcUR
 /mQJrC9ULOApnDfBdjaFItqcwttGiKFX3GTX3qQASyvyqQhlXITOBPWzoVcF4LXfO3MhFY/nqa2
 lFgoBgq0H7hFxOQ+lAbtya3WvgNjiEZUvpp25miLU4vMJsalI9uGx4W8qHYP6s2e+c3B/VucDpw
 6RmF+85xPHsMo+sFCNg==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a929861 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-Jc-lYBnnr43QceUbrAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_012925_226072_60D81B39 
X-CRM114-Status: UNSURE (   8.48  )
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


---
Lorenzo Bianconi (2):
      net: stmmac: preserve real_num_tx_queues on mqprio setup failure
      net: stmmac: preserve FPE preemption class across qdisc replacement

 drivers/net/ethernet/stmicro/stmmac/stmmac.h    |  7 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 97 +++++++++++++++++++------
 2 files changed, 80 insertions(+), 24 deletions(-)
---
base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
change-id: 20260827-stmmac-fix-graft-overwrite-d3ec2e72d901

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


