Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B04DE63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshItuq7Tbwls=; b=yjYhO8LaC+RU+xBw3KuY7K2Jot
	BQiHJcprm41VEgc/lwmd2F5nKNjZdoRMBlQL+Kj1d64vKE2I9NwDptz8NDARoyaeHtTIZTcrTT3NV
	jD8Xez3xqMO1D4v/+l3GLRcc/t/v0Fg8d0/NKZpU0VnxuuRGbbas17KieyJpCiIUXQP8bEQDKvSAT
	x9A7JTywz6pBFUiWERIv3dyojKoRbcamJKLqwF0cdCNe5YWpIovvpagy+KFgtuWdAoy9F6aptoVJp
	inyGePKJYKTovvBd79+vFlhWG83jSxANLcnfLQ6b7oIAbThADzH5JTRF/dAJ2k+tqI90R684ImFmW
	X8Ki419w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTd3-000000006gU-1FF7;
	Mon, 23 Feb 2026 10:57:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTcz-000000006ew-3N6B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:57:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8hSH4766639
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshIt
	uq7Tbwls=; b=LvfWpcdMprHhI2Bo7zpuR5/qRf4NuIUS7FpexbRdIVN4kuNvcm0
	Sl2rzjY/5uPjs0u1+suzqyjkPYx8Ure+n61lQXGb2WDPswxNwKNZ2Z+U4qM9iou/
	Lc0u0tw3TvZMpHCxabxgEArC08BIpTV8RhW/qzmtLEpzfqkRGgZxAmd2czhbHcNA
	xaCbyWIDYLlcDVxT5pr+IAbkIJHj8Wbb7bkGpiON7D4PG2hIge0lc+Roz1ZBvGaY
	VPusb3G94vP45nqmzSaOO/RxusYA+EGfT38G2Nm4v++nZoRFgOov2KYO08vu2kGN
	REUIv1001T26ZJVTAJ6GQzmAFC1XALJcZQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7vf0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 10:57:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506b3fb32a1so399596291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771844244; x=1772449044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshItuq7Tbwls=;
        b=iDBkWOdOg+neqXqh/km+IIKcpNp9IN/t78kz1aOp74C2oNW+fl151C2NzJGhUWxuM0
         nj05w0E4cVk8RW/ceUlM+d/7V/939tiUJiQ+btkaNgSA7UjMimpGoh4mEeURKPKK/Ppg
         KzqEoi6q2kiKmg/Kggt5liauLOfOaXukwCX1HwfZ0No8i/LzOeHiqmMZJJpOAjZB4LnR
         To2vW3ISwtAAdZqVRj74YOZsW/oLCmdLV5pbYL0ELeeZUpZeH6TFsLdyIO1SaoqLnCpk
         hegFvlaXVuXRMXnsBTMxbn0ggXm/1e3GwEnisWoWds8bUe2Ct8gZxlIFhzLDd6b8myvM
         gWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844244; x=1772449044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshItuq7Tbwls=;
        b=BCQG5SUGz/1Uw5zSEYaSR1rkF61sckC/9dk1A7drZz3c2gGg+K2ftXn8XRIcrNq2FF
         cd7sCEfbd3j/xjztNODJ7+IuSda+46xwNBIhrss/iH2M/Sb26wdPFXGLJ/1bCbciiuu5
         1OuuZcWutTh86vV/Y2YmL/o4hC3Jvjt1CkY/+ZhfEVto7ut8cxTPkfv0JkIP0vsEgAkS
         30cPpIsl+TlnIaTBh2XzqaqVOgYV5+mOCLR9z68IUPz5KqQL6FPGExs3bZxK4bEclPyt
         SEEE8joT4D9S1uv1MJ6FeEXJQSeRdz8I/6GHQQDc94SWKCkfRcg6Hn9mDChD3qOdZXgM
         Jgqg==
X-Forwarded-Encrypted: i=1; AJvYcCWfULgOhyEt4yirQKAW9q5JW/BbBLtDsSW0S88LUvshnCwRzwCcJzxDtyLR1hhbv3yRyXMhJhwgb5bo2jGbWzQb@lists.infradead.org
X-Gm-Message-State: AOJu0YwHkxNyygeGDS9R8X5hZerYbkHvdL6ji6KYAwfivuwgnp591nUi
	A5+NPHpdTC2k/o4LgyHfmyhJ3/Wax20WfLsFMTQaEbJWM2wG07RUgVrkvhObBSH4jxmSJuJ6cue
	2a3w1nrbjH/mbTpVuBtOHvuK/AfZYrFOLHJYBW7JmlHMtjWVcfH2zbLi4RL6gUL8c8P+G+IPGsn
	RVJQ==
X-Gm-Gg: AZuq6aLi58GgQgYYwv0V27AG2pgw845fNTP2+OQaYos9yXSep927VIH36D2knVBBmsh
	EfAmr29p4kD3N3BzwBbig34vhs9wyiCoFBVFb4Hr5FSMNDoXhb6EGTYoBM+H6mlE5U5kqTLtI6/
	VPIQbxySO/tZb6U9MDUpBXC/W828onsolnmKP+QUyuP/JiRcmzrMnQaM1w9IyIhy0JqkHVmoap4
	BNX2ZV94SBpaUOZpdebZdGMWykaVAmriga7DwSNr796DBhgR4tTDfA5OUkPimipcVd+j7ezzUga
	LJnmlmIZ2D7d3DO7qfX+MWvTxzK4/Zzu72LNUVHqltqXO7G03re1BXFIwa9CspMtTLbvWKPA+2v
	taqL46Ps7XWY1sB6xgguhOHJR6GjCSqBrKmx97A==
X-Received: by 2002:a05:620a:d8d:b0:8c9:f4eb:ac71 with SMTP id af79cd13be357-8cb8c9e00a7mr906245085a.10.1771844244230;
        Mon, 23 Feb 2026 02:57:24 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c9:f4eb:ac71 with SMTP id af79cd13be357-8cb8c9e00a7mr906242785a.10.1771844243651;
        Mon, 23 Feb 2026 02:57:23 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c60bsm18140215f8f.27.2026.02.23.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:57:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>
Subject: [PATCH] pinctrl: rockchip: Fix configuring a deferred pin
Date: Mon, 23 Feb 2026 11:57:18 +0100
Message-ID: <20260223105717.48779-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=G3uoQqzwbhwMv3rHo8CzAGVUUhUj+DhmlQdTwenR1nU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnDKNtoQe5GdE1EfxYH3cWP7j5g7W2fBZbQJ1f
 M1XdzvUygGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwyjQAKCRDBN2bmhouD
 1wHGD/9gOeDdNWNQGaIjTJ1BjcIplUgUa679M6zz4l7YF/MEDewvDNgHyTbQGKfp9FuPF87jP9W
 yY1adjL4z9CMML1N1Q3darmmdoeiKkKlbmM3Pn5Qh825I/eQ6J9JJ5WREUrwhp9wPuLb5MOkWxd
 +IL+6P72pYU5pVecdI0qkS6KPyashiEHVmK7Z6h8K0BaavFKp6w57iCEF9AF5PCIt78C3lyNcZW
 fNRAaeXk3RF/2Zw0i+o0Br1M2MCPjQGWQS1kvm8fLGvUOLvOmM+1S+7fu59X5htauWtaITthriJ
 NJh/1UfVosuobC5H3FrzvzyYtQIipzbkc6Ply3pjEMCEruUaghTSvOudTw96+VRJzQANOLQjj4l
 RDzrz+Mlc6BUhT03htNS7oxyZ4k3iH7J7HQ6EXe/HWomB/GeBOIHpssgdQlOxDVs33SnTFnplX9
 yVqtd928i7HgQJPhggJ5x3GhHBUe4huxIcx0MthHSC/Dkq6q6XWXwas6SDsP23kElujRqAfvXDg
 NdYu4cqiD0no1pSWCitq3IeL0jLCGKWid7SILla8eJ+sR5ufRobefLmWht/Kzi6lf3Ls3rpAoia
 eNZRZ6Sn1auRE1Df8+bAqrbUHfLkTs+XVzU9Nhek3Wm8bUEFgI/uv8D+My+84RwH1SVrz4eO1fZ 6GXs2LZxL2pQE/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NCBTYWx0ZWRfX26o1M8XIZx+o
 mKgn57iOnx9aNOOKWnjrX/ntLbfcJEfA0q7/2joU5zNT9FdEKj0lVkV4cimrgySOSTyOjLNHLw4
 OEpH0/xdV07KoPFB++ZHhnmY65Py3/UDCEtUMaQrhNB/fHLzs5D9NCRoBSJdkkaLsblKGyYQAuC
 co31y0kLpb4WzALbW7MVpC6v1HbanbQcMBoDynPpksZ/noYMsW0txcrUiBC+ookspikwTh4Yar4
 0ZqLW3VnvP+hnckMSoSsf1Ds5+CmkRoHXIkAei4JtnsWTrEehU0hAuLwAyh+8uFc5gulIxnPJGF
 NCA6C/D1CaQ0myqbVHtQKyhGdlE2fHo28AHPUQgpWkzvJn02hnlMObuhcXnpGW+Y9j3LMPPZbLR
 LfLwlW3Pg0V9fw5ADGWe1F6ju6gSgmtrYoXwXAOOceoczUv6MlV7pmhHhl8A/t91Oj3q0gSBl1f
 Nb52Xa8uawk3qe/LGYA==
X-Proofpoint-GUID: qljsYoUIkGsD25OWn2FNIbA8r6-ih4pw
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c3294 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=wq2r3B8GeWDWek6aAFgA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: qljsYoUIkGsD25OWn2FNIbA8r6-ih4pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025725_971152_B0CBFEE2 
X-CRM114-Status: GOOD (  18.34  )
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

Commit e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with
scoped_guard()") added a scoped_guard() over existing code containing a
"break" instruction.  That "break" was for the outer (existing)
for-loop, which now exits inner, scoped_guard() loop.  If GPIO driver
did not probe, then driver will not bail out, but instead continue to
configure the pin.

Fix the issue by simplifying the code - the break in original code was
leading directly to end of the function returning 0, thus we can simply
return here rockchip_pinconf_defer_pin status.

Reported-by: David Lechner <dlechner@baylibre.com>
Closes: https://lore.kernel.org/r/f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com/
Fixes: e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with scoped_guard()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Offending commit was introduced in v7.0-rc1

I also checked few other of my commits for similar error.
---
 drivers/pinctrl/pinctrl-rockchip.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 816823403e97..4f2e02322508 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,14 +3640,10 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * or the gpio driver hasn't probed yet.
 			 */
 			scoped_guard(mutex, &bank->deferred_lock) {
-				if (!gpio || !gpio->direction_output) {
-					rc = rockchip_pinconf_defer_pin(bank,
-									pin - bank->pin_base,
-									param, arg);
-					if (rc)
-						return rc;
-					break;
-				}
+				if (!gpio || !gpio->direction_output)
+					return rockchip_pinconf_defer_pin(bank,
+									  pin - bank->pin_base,
+									  param, arg);
 			}
 		}
 
-- 
2.51.0


