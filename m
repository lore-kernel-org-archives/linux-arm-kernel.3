Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9FEBFD0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=; b=mfqBKArQ4Aj+rtatEE/Y3NjeR5
	BkP/jnZMtmwzyerYjW5Ql+t1JnZuc8vgMpXAhRSqIdbdXjnjXBDEAVsqHW55K3xVPr6h1Dvlgtpvl
	uN3PghthObl55Cg0CJXQE2B8xMjxhJJTWlz1phnLzJtKH2sbB20grGCeJ3i4ujuz8ivcu4mmGIMXt
	GMLaK8ugy3S59Cg74WtuWi5ER/eC5GXzngqEyyZiZpOlm5yiqPzP1XhTydfhad1i2HTibWcvswbFD
	bW06fMgqWtRgWX6RdXSc1a2CqqKv15ScVDNhddo9L4qBmCl63XQaKiIDvzWoXTkYGhr3ruZMP98DH
	cF8hqAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBy3-0000000FAoN-2Ioh;
	Mon, 13 Apr 2026 07:44:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBxz-0000000FAmU-0cP8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:44:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7SBBK1463124
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jMDYT8BNhIA
	8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=; b=jc2xfMLXQoJy0Jjx6xJ7MvmVwKY
	RseI8gde1K1ROLTbSHC3ZLQhfw76IQEiHlNh2OnDxNXMzXGtKeXLW18mFxu5OYf7
	85BqqrM+nnNole7Pjxq/TlVwmdbjqd3kNlbJBRyXQtDJPYfZomS6jbh5Aoy3Atwh
	r9h64UgCW+NTXXviuNfzosa9YisKNHedMaKnC1tuh1b4tPlWkQqs0tAIUuIawwgB
	MsQwjcK9HAID8y5Sc+zx864WYAsnC/ll7KmTWPlkRiaQxuZUGJJgYWbnF01aZgQ1
	zfG3iyWmDlY0lWN8FU+MAVcZJ9qpPS7YsPnBTo0/0Y5rD5FEAvUaJhrToMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfv9ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:44:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so75759621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776066257; x=1776671057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=;
        b=OX6RI+DLpu1sqDbDeQz6xRRhjowjDWGfDWe/uRaVQgoO13RmDF9C93vBIj9LaSl4O8
         9+6jjEcu1iR5cNBn9WYx3egapkxFdhlZ8Y1Ipyh/uXmiDFql38c+aBvp09+SObU+Qm7r
         xkSQGebpdqFKLODInWAUKIgKUOajK4kUYlGLLJ4IURfdKH9xCpOxmQbEB5QXdj70ICud
         xlohVSS9Vq5S+GT2A4ehOZUD66Ing9OvtgkimFOTz0srIZ1GDfzCUoVEM6W0Ztk2OuXe
         6X1P38LdyNrh2Y5veFc4GEzz+1DyCJ08tGlpofh4zSX9y60d/F1Ujdm+37ZkGEtrI3SC
         Kz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066257; x=1776671057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=;
        b=qoYcWqeUniTeXZrS705mnLEpVRJdMIr6EqjKAcPlGIN86XsfSrb4bnia5/8CeEZRUd
         UJaMOdZRkd2XIVTHFMLAjMhBpvyxQV5MHhwg+3CYh+SEEHUyo/VRjcmlp3ZlD6hdE9mC
         AIX9acPd+AGzWeumle7rrm0H+27rX7ztOOH4+ZS964ZijkhsY0opel4z5Mxj4Mc5o4UQ
         cYyNF/6u8LZCY/M/oe6H6UiLMZBrds3NSNrPWxsSUPgyFaNZNzZzaZVePKl5/UGRPozU
         S96Ng9ne5TCQ2PbqYBdTVhmUUvNe8Q7hHwRa/ZzoJfflvCMjXnuhERpkHr0nteT64W5h
         g1Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8tb1/0Ps19uMWOX30s4aHfo+wo4a7RU9G8Hwz6s5eWkzHL9bxS1X5JJ6Lyaiv+7YbVn+Spim84yt/HEqki/j/+@lists.infradead.org
X-Gm-Message-State: AOJu0YxEsZ6dNqKQJyHO/LM19WqyyMY5epZJjwoe2Vo5YSNf3OsuuqkO
	y9gIwSdhim3Ah8GS7B13pu/MmQgx9a4T8dociX06WhXg6FsYTEzg5JwEZdBUDHnGn01q8WVYFac
	rV49N3BJuL0Tz/boguwyEIizm9yKHJi6l8p0fDCXDVlGjuYAfskcVQkqqttPv0qygoa34dFQ1mj
	Vdzw==
X-Gm-Gg: AeBDievcFf+B3PhFxpsBTQzEmtCL4YWuT3+uHH+XcWT1YpNxgjOBfsczj1ngCXynIVa
	YmY6SdETsWpRjN9yLK0CQlgPzYf+zNT0G+gxsNSei1zRWHcfQro0s25DK6Aiu6B6YQREp3VouCq
	VvEUIvf+dv/8WGAAGc4aT8jP1A6J2uuIf8TZk6kN2VThmAt9ndDQA7YWCzfROUhMw+vc0Nvk4Xk
	T6qBgpEly4Ld9DIfib34SsMTQOUB9CAu4ATefY0tjDi5pORz2820Ux6iGlkuf182txmJnbfxQeY
	UOxZy/zatPm2eN3tohsDLTF19lX1VTpapeV3YAxcqeuzGHGU0dRp4f6bejxTOgNZijjx3kxVFSb
	vW2AV4r9ymYadFWHi9ExB4mG5729Cj9duy//I
X-Received: by 2002:a05:622a:11c5:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50dd5bab443mr185499601cf.44.1776066257577;
        Mon, 13 Apr 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50dd5bab443mr185499291cf.44.1776066257139;
        Mon, 13 Apr 2026 00:44:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm137465635e9.3.2026.04.13.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Document purpose of defconfigs
Date: Mon, 13 Apr 2026 09:44:03 +0200
Message-ID: <20260413074401.27282-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9+/eeTgyYS/yzTO3pnqexv4gWy07zOtf8v7RwgZqnq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3J7EJHjlEZXYb+iPxBermj9EsVFEZq7Qk22P8
 OiDqazIySKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyexAAKCRDBN2bmhouD
 1y6hD/47MsD0PcTGJM8sGmIHobgom/PdUcdZlLirII1VDDJpyXDTs3PHiezEKdoCNSyztcrMsXT
 4oHcTnD/X77Yp3yiQkK5xSwHdQoR0qGwgi8Hg4xHeWmwAoUeaE6rAt/Uet24wdZpfzfcZCduoc5
 Ys3VpGnXHsY+yUt868aAFzOWdqfuH+LC4JOqNvx4KgBINBjwi0QXoHwYey9MJ/97ayMEcbC38Mq
 f377+k1H/ndRbs9bRJoRFhb3vdG5rPwiUBAYWYmoENwxqLmVjrSqkf0sFnRhoG0SwrGslud0ShE
 t+4E1HkALxOeqLE/obi3Z6TRKz+z0dh3Nv6QWLJnoH3h3h2jraDW+VGHDyL27zWjwPqbgwhjIb8
 zJJj9piSymp8nMPSPUIKt6bMV/g3/NfGVUqnOLBsK0XbJQP2cZKQ7eBVRX1w80uckOcJOle5jop
 BVzvei+HZMU96eld6NiEIlqUUTHwLMh5jszBBNgFakOTnBMJ4qnIsPQluJnbZUenmmbe3/PoAqc
 8O/QpKxKBPAFvPRlPXmh95SlRUPhYrB3nZXhirvnwP6Fbv4juHtZDBNJ2yfuskRA6ed7M5P8SOc
 DvkKDfxfifMUfHlL7Cb2WZJaSzSb8o3mqB4vDn0fC4rW2gHkgLqwkU8kP0xIxapmNKNdTZHQaWt 9QhzkBoVibNtu6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h_uNuajy6psb1fXSFyEDlm4UstTisTAo
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dc9ed2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Tz5aH96nyyF_Xlqy0V8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: h_uNuajy6psb1fXSFyEDlm4UstTisTAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MyBTYWx0ZWRfX6WBHBERUik47
 C8U5lZH4lA/NyDr56qX2FxpoKJWhcl59PGVTBm5yaFyZV/eBGgqgPGFBNmGTt6DVqmNMhlqwGOO
 brHVcqRVXbIo43wXvja4PNq22ENPzgJIM+DBsuy6TsxFF5UFPrr2k2uY3gGUwRJ1xTfgEZPmAMF
 y34nm+SYd/0gH6xqw89mPTlxvoXGLGTiTgXorV/bGhynywoQPWR/Ays11iGov7ebVE3i/l7OGH1
 LdPQwGxNsmrbzFsC6HzpQoMfgLFFNGNHPuKJVsCiyuCPjeQhOq11/scRsr8BKAxsGgTDk1SDiPa
 Gpi5zAuiDtbm2Y1RYJQj+Tl45LoTvrJjJtPCiyQTSKo/Kj1/EimUxgILwcIzanH0kPPx90fO8jN
 jj1e8OxJdXp60oEvElYJH+NLm4C8fBu/b/SdZJzZ8dHxHcVcc/vbtlGeO0AEBvWK/bco5YwDTnn
 5/mXiKVGJs+uwE+YG5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_004419_322946_CD1BE37D 
X-CRM114-Status: GOOD (  18.03  )
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

Common mistake in commit messages of patches on mailing list adding
CONFIG options to arm/multi_v7 or arm64/defconfig is saying what that
patch is doing, e.g. "Enable driver foo".  That is obvious from the diff
part, thus explaining it does not bring any value.  What brings value is
to understand why "driver foo" should be in a shared, upstream
defconfig, especially considering that distros have their own defconfigs
and we do not care about non-upstream trees.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 4029dc6938d8..a3a90a7d4c68 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -207,3 +207,13 @@ The subject line of a pull request should begin with "[GIT PULL]" and made using
 a signed tag, rather than a branch.  This tag should contain a short description
 summarising the changes in the pull request.  For more detail on sending pull
 requests, please see Documentation/maintainer/pull-requests.rst.
+
+Defconfigs purpose
+~~~~~~~~~~~~~~~~~~
+
+Defconfigs are primarily used by the kernel developers, because distros have
+their own configs.  A change adding new CONFIG options to a defconfig should
+explain why the kernel developers in general would want such option, e.g. by
+providing a name of an upstream-supported machine/board using that new option.
+This implies that enabling options in defconfig for non-upstream machines shall
+not be accepted.
-- 
2.51.0


