Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3515FC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=; b=siSRpOFobK77RXacE2EzyaLvyq
	DHOQm3ZVumQ+Wj7dqEOBDwOt1ca7IudmTc0SNsJJUDMP5a2xA9LurP5ulYHN/OgNoC+CGAyCUqKVf
	ApRE/ZLEsQThZRTjRlgkXdVTLhXraZW2rskJnBnvS2sCIY32IBdE6RxC3SibAfzzjomI8DxJH8QCL
	GICUgNws62zhYb3xlBMKXbrpPv6YO5ZuiiZVmraRxych73fG1CDd7nW0I6JPKX9hyJ2AevXDeYSa8
	982cHp5/doISfESHTCYRzU3GA1FEorBSfUNppMhuqwfcj4KBELT5FtCXAXlY8HOR8FOLpAqBS2UZS
	Uv6T5rMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkG9-00000006Iux-39VQ;
	Mon, 20 Jul 2026 09:26:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkFy-00000006InL-3ovm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:25:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K87Qq62000640
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=; b=KlqIfYj24yaFf79w
	7Rebwfq6wOB8LJIJfcOSwVzj8iaykOD+BlPcDZSb0cBdWQ/OJ8g/3RUKCH8I84dF
	bTklcwnNbIC8LgFDvh2Zd41sQa4Z4qY1zfhH5zztNgAHUzbG2j33ECwyTCj4sYeg
	2LdXdFfBk8SiLKdVSnwAmEnDPSHtSk4ZVYbojPcQcNWXIcZypczqSyWi9G+LaMkX
	aZkg1tjB1QO21JwFUq0BmbAHIvd8q/a4xCzpwESVMJTdxYAw7vYZo0Rqn+oMRnt6
	2a0leS5KgupFo3792wHUl9yNhKjib47ri1ajCPMMrb4qrUNfn4M+W+Y9eJkYXbyl
	lfcfHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgcvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso144483691cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539549; x=1785144349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=;
        b=CfV4H1TU3SY1GtuFj9T5SovDHa3mLea8rI4RDUpY9cCQkd1ysb5L/wYYULK/wrkJIo
         1jj6Sqc7PpdnZTxEEG61pB2sxTl9/rCAy/tuLj95g1wk0t5hOauqTkyEBVuXi7R3mCO/
         dyfhdfHAOdKq+fZ3xGbufqFyl8cOBaZOfsGHwzMr2VBGHYjyxBl1i0XafhTs1Myh0Hzo
         F59RWzPBx6QsEztMu82xTXZPAFhX35gyqlk/T6BeB3BMs5o8Valhfsbfb5x772anz8+6
         i4PcbR2fme/ZR111FnZoNTsx4brS1KYqbUlcpnQ1gZYC7WTflRIE1t199v7NgiA3c973
         AaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539549; x=1785144349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=;
        b=gx5NPbg4rDosgsB/iZso4tBg5FFg6agUNFZf9t+jR6SwfytwNKmXwM/hEDN9N6Tdim
         8MoaEHgB2+yOl+uv3/K1UaVKXc0uVyptoM9ZcQGDGSh3xGUigF3PXVndxSf5pWLYQxp/
         Mq+Z2bXUBoe2XHODTEW9J9NWss60blc9//b4wTxQ/ncAScEVNvB+ynfdpbx8Vy4ERW8w
         u6wMNwCM40majUSNLb0K8WzEUiLVjRw18bKEzjUjg9jvLEVr6rWEw7J8W0SovaqRZGqG
         IW/x+DmAbN3sOCiiR2ekIqrXehxwdjpDQQf/F18ejXsE1g/hn7LTtPYEObD7Sqvn/jUR
         L2Ig==
X-Forwarded-Encrypted: i=1; AHgh+RoPxj+RAASvwjW93GmXxw4Bp+PaOC/XIcXuZaHchbyQRTJ2NzVWMSl2u4BkXKNisdNy/1lWZ4p3c27TV7leeI1F@lists.infradead.org
X-Gm-Message-State: AOJu0YwjQcxgrqnOKHuULvh1tCa4GklWGlbEFgrYQNYa1ZFrmOzHo++e
	RfNyN2gi6xzXbhwnbiPbi1TvEIrSJBn9CIEpDf2X1Z1jCT6B2ryc6mBS39WCZVMHZUxGKj9JGWh
	CPp1w2crKvg0r32+LVdkjdJdO9Gm0Zt0UBDu6lCMRyxl8IIxjYJu3d1nboEo9Qwl8Q/0++XqKSy
	RHfA==
X-Gm-Gg: AfdE7ckD4xHAOE8HRa2mNpvdTgDV3vYhkfBoT0Du+cPrMLkTHwac4okQI7MkiwwOvBI
	DNeNzF79pB0fg1fOlagLUTDj2vrTauSJw26CE72JU8dTMlmNxoYBaj4fcV91/TD+YXQqAcz1eHF
	nd2n+rdGtodn/qRhFfTPlrPHBhZuZZT09rx2wVOl/pNSSVodcLbfLAhuTGxVrBwy/mySxN/lsOg
	dOnDNdjG1Xp7e2ciVOPPfvoTCjvvGPURJpkVlPmpX9zbfBt8T/e8TM93oEIUJtpE6yktin2SmWZ
	nUJRYqxeFdxvY3yIx3Umlp2FQlrnOQWVRO9h3zCXYL5+Tj8+WAtXWmW/TB4nPU4KdAo8sDkKDFi
	IZJdVPoFjK/w5HRD38PaG+jlfUPQgDQ==
X-Received: by 2002:ac8:7fd5:0:b0:51c:22c5:daf8 with SMTP id d75a77b69052e-5213e886569mr118276561cf.59.1784539549603;
        Mon, 20 Jul 2026 02:25:49 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:51c:22c5:daf8 with SMTP id d75a77b69052e-5213e886569mr118276431cf.59.1784539549156;
        Mon, 20 Jul 2026 02:25:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:54 +0200
Subject: [PATCH 7/8] net: mv643xx: use platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-7-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xqsPX1hXJ5p8S4DkE8vtCmD8bNryEUzUedAtz3x4vb8=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpd6X+h/ifYFhQyBjNRAMZp3sKfs2dOQQAGWOSJWeEWTFT5/
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqXel/AAoJEAWdLsv/NoTDaPwP/RCK
 7Pwxf8vZOh5uaFiaUylNW9sFBv0DTkc12XbVDBYvSH/UfZrhZNMpdObQiVZ0SMsBjpcFYp/1AZB
 bv/F5eIASG2zBoN057E5VLLCsx82l6r/JbeVQgw5sCPYBDfaFMn5uPaQXGHdfCtVzj107jr0atg
 MpQOTuIilyBFr3uTKuOU7pU31UrvyYd/WaJ9iIF6yscrWH/v4Qs1NgyuD5SXNzXQy3CdXMuZWPw
 OfBtGBf6WPhpJYK8SJ8cxHXNTC3mp02VZHt8QJoXG+UcIywc7z9x2aIXBI2wqX000BykBPNlSWC
 mY3n3CcQ2YJPZstI6l/D5a5Ag1tvZyjFn23kZX27b2b+0vfEWAo3XxJs4LD96b8ru1CihZM4DNr
 J7ePsCpJxshz8tCUh/g8vlubXLhRCQuMOCve6JfkiVWeFuCbbrtw/uB+qI4BX6ItSyElc3Pkd9A
 zqucZ40Ol3KJyC0Hpqxv0yAHDnt73BHlxnotHkeJUkco+UU572qEZp2P/tHBng23kf7VdgJKzfM
 0Vmj+kL6FAYBqwOZUqDULhVWTcaepaa6iM5W9ZkRvjLWWBLCdYGzVZKBmU+3X/B1u1vnRuKOPdc
 vNkkEAD4/hll03aBOJFx5J4KIfwjuuLHfYesAeoCPVMULek6L0iDo1ICKKxFU2N/ZGUpG50fB24
 46Qsg
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5de99e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Ue-CkOehRSWfgkZZKZIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX7PcDF48vXQmA
 qkx7FnWDcezJ9fPLB7wDO6CAQ1QIv6xGnsQquidKui4xku0TnOozA2MD0mqbMXaQ2kbV7qIZwZx
 SaQ0lM2192qZ43eHYxzgRktIGKGBFO4=
X-Proofpoint-GUID: bueKTvUWnOogoA4k4JCmlrMNaDE12_Ve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX2yT9IwiwH3PR
 0gDOZJdrKOb8OsuP080kc68ae6E0wGU02lydcYYqXka6V2qhhovkaStZhpE0DmPTvgZLf7tK6j6
 hkD6WMP7oppxr64I7IeL5tErjsszhGQDzrVqlz28YigPDJwiLdYG0rFPdh4tEVz40q5D4K4ButV
 PzsVH1CIYghEBZ9hLy+eKuKK74mD8Eq/7ciPeflYhEQNx0kVCkq42PX8jvsppXaT9HpbZQ4D8ZH
 ioxDQSnyxSephrbHTQ/0x1Rw/m1DaOU2njNL/lSYQoRQHSZwmoNHLnTofTrhCjt5cwIGYol6bc5
 6nQgoBl8l94CRMF7ZZTb8qDKUP8czJVP/qQ/JDlqcAMvr6149rFYU5mvjMS4WzDsFON0yh2ErdW
 1b8P9xNpmorDuxXxNQjLGkQBph3mMrKCMCadzq86HyQXUMpnVxKCQ4apjkzzBPeMvD9oj2a9Rom
 VD6iGB6Ws85iXQ+QRcg==
X-Proofpoint-ORIG-GUID: bueKTvUWnOogoA4k4JCmlrMNaDE12_Ve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022550_966063_A499F584 
X-CRM114-Status: GOOD (  15.20  )
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

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 9caa1e47c174c9d7a161b7f2e2ee12a829b813d4..2f2d6cce8d852b9ec3ab42678a04a7915d1f00cc 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	platform_device_set_of_node(ppdev, pnp);
+	platform_device_set_fwnode(ppdev, of_fwnode_handle(pnp));
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3


