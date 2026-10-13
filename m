Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EE5CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=; b=xsmmVRfmdybvtnaqOwPQ0YMywJ
	ZmX4Qhokn9dcT5I6qwWnlN22bgxGrZ8o2iSSLPS2638CaBZDmnEcksZ5+VusNgF+xXy9Y+Iutpfph
	QfQd2Uj6Hd06FocJlt39o/u3KhP7cTYBvu7tQ2Ov2PL9hhLf8sRAb7wFPWsou441DDvMimmxN8fCW
	K9kEik1+1f+/e0Wu4XwKC7uojmU5K5hfF/2Ly1aRbxSwSgn64E3sCgoQd3crY4kc8fKuye81kjeQ1
	bZNr/FD2guxtSG5eV9dLG9SsjVKRaIUl4JIsiSInryIE5fn2m19Q+OYkr+cS2ys/Q/TbO2w23Zn8U
	ZVgu/+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGu-0000000CUQ8-2E0F;
	Tue, 13 Oct 2026 09:58:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGr-0000000CUOS-3VKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQdu3054805
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=; b=QXyeWvDwyJzJZmF3
	SJPq2gpYsl2cjS918L9xmE5rDouOVwxHChyDHK+jWn1q8Cx3239kqgsSHIa5ncRO
	Dl3y5iynJLOI9Zk+APut40MONc3zpOY/T7vaGjzou8O9QbysdQtWVJfRITIX7J+s
	mgOpWgVsPxyWwTIA/2p2Gcdu9m+d/lL5e/HP5QUjyH9qwxeBzSmAlogYqcZ2sVPQ
	PB7t2FyqEchkGT/XqwACDvpZ9ePraray71r9Qgrr19IvaL0O2MstW9pzJsRxyQvM
	TbaQfXPR/6+QAFE/kpzaQXjXHaMdLjG6yszF3zQ+nNwudHEOErYNfV9jQDuHF11Q
	dv2/NQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeunmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so44966706d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885488; x=1792490288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=;
        b=gZRLfrmwrQuKgsAm47OvS6ntBb6pYudnviA2BOYHtTwgh2OwCHhzgcFvomZYbX2Zyd
         GQpIU1tKPvwfFMqvZfnhhX2S7lJ5U5MTwiqKbIqkkq09Vlq9xbn2dy6TeD67iJH8kcGf
         szPigK+rFJXTU07yqdGMXRg1HBKfgR++UpgPA/iseNGdcHb/c/9oUpcDzHga9Sedj5rO
         hwKaYNclTrZBqtDcB9FLpz0Qz4FMJ5fx3+a+L18UxZJYDD5jW+oziPwUvHNimCrmDzoJ
         DM5RwMC8pk2TQZcuYyRumW+HFm/8FN+oUDHeKOY7k3FNogo0Q9AvLT+Cffj2V0lBGWoP
         FE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885488; x=1792490288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=;
        b=yRy6tk/DamsfGcD6tZSHR+Si+9psWMVzErBb6HVQ5sSVeeV6Atf0kUquo0gwTQDyYI
         2FSTYQ7DkAa21DObFESLP10PsKEewWaXcpug7uQbw46Y/KkoEahL/4lyJMETDcjIlUe1
         YrsZdhTQsumZEiEhRWIprWswJfqCpiLJtw/UN0jM9iU/PRPvM9GwjZ2/OafslTP3qQgG
         unZEjpFmWtnzfov+OpY/KfNwC4kPfW+LKJNL9RxOPC28edXjb2XpUUgQCmSllgg+sOjX
         RLgZdZnW7VvQOXX5yoO5IVnjQBMVjkpfIPajATq7m9IKFEVIO7Eg7OHDFdIDXqin79rH
         0JoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX4IgMYKuuuIcf9F8mLUsg2rQsJEeKCMXp8ZsX1jBIUmiBM1ukgFuz1p9MWhz1YZHltuuQnG6XCEigA8hqzAac@lists.infradead.org
X-Gm-Message-State: AFq9FYIUxsderKur500ZpWlgR2rCb4+uoSLAcnxQ1W0WZ6Ii1Zw4ozq2
	+KWpdsCoK9k5TDZp5Y8mZ2qgjpo2VsohVOJ2DLt9hzR9mO1EH2eJif1TUQM5xB+XgJh6B1fWOTW
	yj1HwTnbsC0ehGzcAe67QQT18hDZv5azKzmzqWarp+qane6hF4hKodd5ryUnBza+hmePV1JYcnN
	cEOA==
X-Gm-Gg: AYBFou38Gwu2zWUpRpcC4Nb5Z+MewhhNwy6xFnue118kIuA471DoBp15i5vX1q2QaZe
	2dqoP8adgw3EJgyFhSUPWJgZQg69ERkFho5L9KhBS8agqBqeTkqokr/JCfbTu9aruMPbFM52eSL
	Dre2VwyX+dFLMWpCv0wjvk/tvtrB3bprm+VLQvoN2mPcp0QgAQ10CMwQsazqnseP9/xdrQQjvP8
	+UQOoWP+EI2kDWp9E2MzOg3r6Em96ehbMpv+HhgP8bfr5ktXfkeuGmvpJN+sth12ReQf6v/RXR4
	Px1xVpkLk1R2Tm2HfzQ9oc1LD90Ml8M4XYaAd6HGDfem5n9+SGzeXhqtFQZCOeQechasIXiPCs/
	8llOgbCJNx+ZBl9THdp8AnAYrRg7n
X-Received: by 2002:a05:620a:270d:b0:93e:7939:43f0 with SMTP id af79cd13be357-93ebd247f8dmr2055646785a.32.1791885487718;
        Tue, 13 Oct 2026 02:58:07 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93e:7939:43f0 with SMTP id af79cd13be357-93ebd247f8dmr2055642985a.32.1791885487269;
        Tue, 13 Oct 2026 02:58:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:31 +0200
Subject: [PATCH v10 02/14] crypto: qce - Reject empty messages for AES-XTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-2-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=10czG1yn2EOwOEpiuflfvi91l4e59NVnoKNaveNpS5Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCb+PXfJPflooYW0X+6u/+Z1zoTOjPBF4ifg
 sQTVCQOBfKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AmwAKCRAFnS7L/zaE
 w5OAD/44Cd45IorOSGi7mJwtmQ6WdaX6qmUoR1aecVb53vv1qqtm5lnfb1+IN2Dk7+NrCitUW5b
 e1PMnKqDk1SDFB1UP1LbKBvOtKdIcWNTU0mJCeFaLVKyVcAqxM1Do6tEc5BbNE3NtWI2GljqwHa
 qEbnP9Mhlw4LYMzo/oi/v+EY9qrsr0Hhk8g5D7vWMnfdU6zUGkckY/nQftXfAtqSS0cvaeQ4Ob2
 SN70xeId23HurGpcM0RzdJ+sIYZqwbKc9CaTe6Q22uxaWuwc9VUOarSN3dDE5rlMWr+5HNDhQq5
 I+Oww8JDQ0crG12sVqslneavK/nXvcBcZsh9VA8SflNa+1UlWluUkzPKKVxJfiqKNk1GpnTErBX
 NAkd3jh7LRuYX/YGn9M7vWZAhVPY6DC21q1zpYYu31ssbg4b3MKlr30GOYwVFQaGhm47/GhH7ze
 aqz5RLzouerOM2dr1ApwyecmfmK7GLbmrzFKgFDvJP1qlDg/2KrHsY3i+59TUVvqvhqotv3YDcr
 IVoqrFGjxfOGbjyC3zbkwMdD5J43XN3EA+jLJjjWa9CBoqqRJHSyxarR4EsBYLj2Z3RPkE4VAvO
 UwaNViQiK5BnqSagCdpQcbjNwOkH+Eu1mzLEKKv3OKLxKmGJPKyOlsbdq7XAAt8RIYtuwuId5q+
 X3J3tQo3RtNudlg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: VZBJ-KdxoTtC3n2dUSsjNwLj27Fbp5Qr
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace00b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX1VssusZzWPgz
 mGgoEQumPRC6lPRM5nHf4/YEWeR8VipLCnWhVzj8GBB+Rvc2VUvDeOOLnF7C2br1xTWqhxDEJOv
 BYm+kZUFke//MKafOEd7ULuV5zd6NLs=
X-Proofpoint-ORIG-GUID: VZBJ-KdxoTtC3n2dUSsjNwLj27Fbp5Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX4wjwt0qi8fQ6
 Y6x+tOOBincw1K/gSEyvgLbOj7r3v0pGbt4Jg459Obrv5pz6VIjybz4dAd5lNIzyxwGAUxpo8pA
 W18iRQEy7htS07kGjVKfsV4FZGhBSHdce3h2Kw6Fy4sq5o9AfVo/3MzizeUMasc9/0hE1G/ehX3
 eag3eamiMkWZd6l3msxeATpwPCS69KfUFPJqrYWaFPTW4Fc9mPZ7oW9m0GerZQZYrynI+ViRE2n
 Nsm/mFT2prOEaSlWNFkTX5e63A1I97Jn3/ZIsJducHipAbVrEJwiF5V5uixtwImf1+kBwm2VKgu
 qUN3OpPLBvsBQ3UvRvbRe8RQuYWBr09U24a2/0WBocvSHT7l77pm5ILnvNdwra5TbeLLOt5E2Kn
 dVHXxkYbLRmOR9oym/BowCeSFwmulv2/T0czKlRrgAfx+phx2XSW39MyTtAYBLXD/m4FZj/qvl2
 QSpxTfKQGg7X3mcar4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025810_001090_9E511B30 
X-CRM114-Status: GOOD (  17.04  )
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

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 03a3cec2bb90e8d8c17e491ca40ec740a003d1b4..f177062eb735148561f798d0d3e65265f3235da8 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -222,8 +222,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3


