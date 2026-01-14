Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE32ED37E4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=; b=jti5c9StsJDd8wA0PsYCjZ3B2j
	KncbZ/6w34/xWQKD50zcONBPT/vUJ7G8aZAz1xirWMx9rW+c/NSpfayx1Ppo4Mt6tkWc3ktgyJk9s
	i67UDKWZ4uAP4vdG+28JS/1SPIL3R1Y4Qz8mNHZOK/ykRr641qHPTvNU2lcJIb4ufQbk7MBgJHsPG
	WPkam3iyPbG+uXZi/bFdrDeZ2KC9r/HT0DHtz+RbnthgXjNr1TjUVRBOg79m3LuzDHpBFsfg9odFV
	VTvg6das/7VYkdnOjl5TdnHwtJwXymTT/9l/cp5TNmZmtDLrK/c0+nuhNcUf9lTkgYvJ5y+/W0E+A
	XelMZcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2qb-00000009i4W-17AN;
	Wed, 14 Jan 2026 15:31:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pW-00000009hRp-3zyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:30:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECrl8t2736145
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=; b=c0gmla3nEwW1grom
	dXfhMbs2CUA0nDw7P+mN/FxD+dkR3rvaLg1kj3Nh9uN83L54wADzxSvhai1Czh3o
	2Z4/Gt1Ftvc2cgOWr3LZiD7Uq4ypjP8ZT+7sDuhbqb3HYJDQpZ7OrzIf81BX0H4J
	lF1mR5L9zhlV6RdlrxyvfNJjXvrj6xgubK3JL0usnUC2m/6pPMzEsOqSyd7zVVdT
	uZolIq0Q9qTwubXeuXWTAJbOaeGgW8HmvOOKNw2Z3XPfK7RiY4Nd1H40O0BGDa4R
	EQ1XpTh5M4lrFkiSZ1EUhg58ozURytLvOpuOMTchVUUu0v7sRbxOU/92dxJcw1iO
	O68bPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5ggq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5329ed28bso160201085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404641; x=1769009441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=c1EZYlcXJ6wosI3DgiTT/kYoSpNMgOz3rfWxkYsBD/5FSTEkh2t9EuAy7stQxWSxia
         gEPvn3i6Syz8eV1dHufkbwsP0Ad7su4PTmrhjoUYxps5t1E0GrniWCQ5HB8a2jt5/BFC
         Dvp4Igc/lgZzMwDJx8iJNhHQ8O/YxYFcTHCRrQFcsF4NiM/h+j1T92Xx14njQhtFzwhT
         xW6bC0X/4psiZcrAke4A6/oh3RqYIUvOuEhafYN6wKQJF1Xt1e4DSTrzJjuygLPQ6rOi
         dVl4Pmrpn+LlXgGh+5NeCdxhs2RrP0/piTN6LhG6FUpvyLenha45BXKNIbLpd6bhBzHc
         g34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404641; x=1769009441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=OkCDL0JRDzkPULwT6u3L7xE58bkyzp1xksU/dMGcf005Bo/FOPmp0601VdHpzjQMCV
         OGNaK9xRN9or/QmfuGNFLiKuDJSRbDa/yWckPU1KeZV+T7PXydIdRcmUyOTo4mkpeQXs
         mKIGOI2PVbZcV3Ifr71MXJDTeDuGJd2MbHdrfZ0x7lSC8CCX8ykzSJmaIWsaJpfUQjLm
         xaPOjmcIo0EwzUdmey8d0ELm0ZiKLdixwBBmsPnCjYuXbnUU+lOM/GfIqZVajVoUTAmb
         dzc8B97cToSNTautgpRrZtD9byA/Qa+Z4XrdnxDNDk1+zVLAd1jDN77KXPlvicP3ltOh
         iHOA==
X-Forwarded-Encrypted: i=1; AJvYcCV0X29aiQwHpaydRTTTTFNrMpwE5igRXO15V7h7cfShXLLN7MU4hlZXNMSTEhzBVJAg5KaujARGYW8yKqyb74/p@lists.infradead.org
X-Gm-Message-State: AOJu0YxwpDP7or4dxVOj/UUY6P5QzHpuuAkx19+Fvaswxozo2lICb5Mk
	2aPuzg/Pd2JiQjOwcWiI891Mlg65od4729HpEKeqzjVBQjWVm6CdlwSg4gp8DbpzWz8ppD6u9+T
	VRcltYRn22Qxicv7njFTxcQBFQak2VT/gYxXsl9dV87r1qh/javf4Ip1ag0zs7C4FZ7PGdEUaXd
	UDjw==
X-Gm-Gg: AY/fxX6iXZkms+Y8vTHfGtwwIgaRjxO3XuY+BZ7dInZakD6J5TGVeJsJq8kHFEwqVev
	TMOdEMFw59xYTahALfO3rnLtUKf4P6T4Ov2Jx4ejAFhp7b2rdvoLzn4B3wI/9UKmTPa0Wkhddy5
	slMt4z9CPJBDWxols6F18XwDmvvjra35zb/CVt/Ti4mlpDr3cP3trIZsf6Z/qUmrwcnH9GzqvEa
	WLXFHnaBjc1P/JlX4BucrQ6R0zcdTVwcATSQ6Vd1oodF+kpotJfUmQREVK0xWpDXnFKxcrq402u
	g9un4i1lnCsgf9hKMvG1TtOy/6U4o76wwTssMe2B5GTyaBTwDwVji4uNFlVhMgaUhbhJ4xTm0Ib
	ToSpVihY4oLv7z9JNDF0PkDtvLD/6Qx+NfA==
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311806385a.28.1768404640537;
        Wed, 14 Jan 2026 07:30:40 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311794785a.28.1768404639752;
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:11 +0100
Subject: [PATCH 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9+1hnIFGck3b+xQzUfQOk+LUFT1gQJKcE/unZtByYAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aIvjtMFFp1u5KZIz3s1rXIH/N4W/pA1awz0
 axCd4PEfTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2iAAKCRDBN2bmhouD
 16PJD/4udox+AT0qW++6/oS92v662DKt4vHflxhkYd1Y7cNFl6VsgBSRfzaoloaz0MEHOAVFGMt
 1UyMr93P+dS8fvc4VILacc5vZbJ/kr00OTwdcwQvdnsePTgGSF9jxGxB1yMVKlFjDrLF1zPkwpl
 29wGLZ37hS0UH0TeGW2udTIV1YUSrFiYFUZYsEcMt39OwgRdby8TpKGWJUjQxIvBk+/3xZOt/e7
 NPVy4lUSbhDTBQIXlTFIVTRce1yycOyBjEl+kvd/FhG6SHcCL61dVRC/HGbXL0M/wiiofXEdasR
 r9lwXPamriRLmuyjJw24hnarxswAqVCniTLhEcripalHasg+sQl3suIahqkaLyitP7Cnd/tzwbK
 +0IG7HVcQKU3c99Eb4MDp1+DQhaoB7hYCDuhAfVj131lDaC23kfGy82We0gW1UU3HljSGp/099i
 9dIEF1tOdwQ3Fn8QJ63QNMNDQrnXvvHNhKtSsvxkruUtxPw5PxcVn3TXp4E7SFojcFSU03Vjr6P
 1PerYKudeLt4fYL25YhswZnxQ55f9YEHdXOpcT6ioYr1ADvhmpbxvYqiutI5oF079O96zENLJW6
 XqeT+zpnIQ6JT3SXsguxvuciBugFqYtmWU6xsPv/UBK4NLPnIsNYRhMDUmDpn3uqmgo9awP1tGd
 9qrQnqhwTfT+JiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX8IU7OJAHzhXS
 DJT/ymbbG6uo9L+FzLjPpxxD6ZOt3WhpGXIAnJ6GMXrWiTcETzrzjoSfACbMKlpSJbzW+qaxn1x
 qJJctcMPuwiBT1QjQ/mYiov6ETa93qC2NknzIipPYIPXMG3gicIMUPJ6HEv7mzV+ERiIVto/foo
 Xg/OKmfGKJa9SoZqu6wvC7ynLXZJqp3yFSNamrsSHqU1QI0ZRu6YOiCkhJbxM1X9Q+khmoX9ITC
 ZuBDtuOkQDBsZfHrPQh90TOXywWTN1kQE0GX3EYJSFyApPaGsgrpJoscVFz/zI3zjy5D+HrwDK7
 zHkqHqtylC0ANLjObgm12NqFcLKcF/DFgaRKiBZLDhuE9x0t0Sr0eXNXah8R+hnOeoAjfiG1yya
 laChgU/Sz/sN4QHVNTm5tqafgEu/2mGJGH6E9gMMb6XfSL/0mbQxD8CGFrbeuh2EqI+0JOyywG5
 Og2716KBYXpX4T3G7DA==
X-Proofpoint-ORIG-GUID: I4oAUKOzFk06-LAVOVSR9_qSBt8L9I6O
X-Proofpoint-GUID: I4oAUKOzFk06-LAVOVSR9_qSBt8L9I6O
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6967b6a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_073048_101580_800421EA 
X-CRM114-Status: GOOD (  14.58  )
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

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..bbe1cf712965 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * The lock makes sure that either gpio-probe has completed
 			 * or the gpio driver hasn't probed yet.
 			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
-								arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
+			scoped_guard(mutex, &bank->deferred_lock) {
+				if (!gpio || !gpio->direction_output) {
+					rc = rockchip_pinconf_defer_pin(bank,
+									pin - bank->pin_base,
+									param, arg);
+					if (rc)
+						return rc;
+					break;
+				}
 			}
-			mutex_unlock(&bank->deferred_lock);
 		}
 
 		switch (param) {

-- 
2.51.0


