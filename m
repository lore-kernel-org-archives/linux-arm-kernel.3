Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDDBEA4FBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=; b=JQwVLe3cvSmf5KldE8ae3ve12g
	H0+i5h6zFJKrYpSJMzBjDe1J7va0cgm+6XNU/A+bNn3Hd3uUlKkxm9VwLxHwl8HeEcX4cb76cuJGJ
	Mlqj/TLKBGFUx8sL79+fs5wOLHpAV8aY/nALVC/nkEiZiDlfQLt6rcd4cXIquQoPrXncN4+zcSqhX
	Ujj1/fQvHEz6JrubQks1Kk76oIVtZPTazA2DT61PMgUJYqJejcI/ky9PqLPceylXgCyjpLPNLZrFo
	2y2kDa5RWpKAOcg98vwgjJgVLeeN6NvuzHQkGmxyxGsFU03DJyhapeJ5whGj4hFkPDYSOaXH8thOy
	pKnwbUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8T-00000000NhB-0v8A;
	Mon, 23 Feb 2026 13:38:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8M-00000000NZC-40AT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:38:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Bg1c1249093
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=; b=Im1mI+xxY5Dok5Lg
	jCoPoGNfoc3/riz6XIJOoozon7D78y3Q3OFgonQcOc52ns4mEYU7c43JhwfxyFt+
	LMAi5aU8XqKO9+oiUm7cHxj0z+9aqxpF8/SOHBrcmY3XH2SttIry5fxi4xT0eUKv
	yhoRZZ9an8P5paLgGSkYSZgsL5Z1/zVVvnh4UUBz4j2YNuFAUrGvs2JJqrnT/WmA
	U8JTC1G+3L8k9hUrOXgisG4JWGxBzSveSc+l4wtOvR5Fngui+ke5gAzpByutxc2q
	8Lo9DSuPx72pFAjcCWe8Q09WK4FO9o/9nkjHnFNmFpEWUaRxo/UNcxrVwEBAl4w1
	+ShE9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so5468896285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853876; x=1772458676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=;
        b=VPcJg9l+twoGB3j4ihGzSrKd5RoBEK4CLjAU+xnX2b1F5MPueqgZgK3vxVI32LWMgk
         tFIG/aw09urGLiceK/DLvBFD7zxGkrJYr+aEzxaTTMDwn1wwg5FSuQJGGXEbUcwLDEX+
         6+NO+ldZTVMUNDjuot/FtYXHEcENxz6HdUjCP+ls/emE8x2tkskBA8CcBm5dEq1nEt1v
         QhvTw4BKKaOoHqFJRboAx2JB8Yobf89663cMQo0pUBBabzOz6e6zELhJ6EpMn9LqbSyD
         QJrvkk2SicqOmyeMWGaT0cC6q96938xCgJKlpZrnHIekjc3l5ZzadN33xwiKKkU9/T8k
         L2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853876; x=1772458676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=;
        b=WKis8rP5HTJ0kgAO6sggh8VbrOhiF9Q2VK2PXZ4XRAtF4dfWi9nVTXHvYsf1OOK2eX
         eQ0bInNFgEa3Dxrl7z+a+FkaFHOmKPdyh549dFdduLVzwkrwYuoULo3DZwaHxi99f6LJ
         zwUxzjA9IcR0BqclG4RWi6gUShf2iAnISVnm9hJ/8dn3JVEByDzIyMEc8r699duAQECz
         L2rZs6zs///EoXmoXdylRiwnGT5amvUxKbm+WpRbihQ5q/See/PS6VZSUVSjn7qjdkLi
         dA5veJ/V8kD1odfrP7s+M57ux9lZfka+Di60qjUQWC4/R+cqYDKYKyTZHXmCAGy1268A
         UAXw==
X-Forwarded-Encrypted: i=1; AJvYcCULX4QFMuapv+ByjXZ1wySOazL/em1X6nS5o0I2tZCcvRVTuTYbKGr+LFQiElRxVBoPHpN9ZzOr9kPGG/FqsHDb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9xGHvbu+Ds4VfeviEovFZnaB07Jqhg5qGYqJ2CPGkrmOfrtfw
	mS3CCkFWXiRddyp/sKHmTLNHgxV0NTP5PE5yo1tm+WC367jHZX3qpYgNUqCliOvbPV8BVt+17kh
	5MhL7RlnB3qWfVT/acfJ4CFgE0kLjFedwKDfwWXACHnsatgKB4628p6XDSpyz5KA8igtFddbQsF
	bA5A==
X-Gm-Gg: AZuq6aKlQUGKCdd0Z9lO0OVu2R3CHscn0CpCjunnRPdRhDtsID8BdFzVH5Dx2eauksM
	krlYKgQZS85Irfauzgso2MjRdsKdxR2Y65Yf1ih6bMMaA0sdyKyhwL3BuCKwsogHAXA4Qu8gFi3
	i9DbrlFf17WLuB82TBUh5lGJ2FSUDoVi+5XfrDvDONklTj8nPeZR5G9p6tcbe3QCUO1PCoCnppy
	K+wGGyIYwAZDBmOWzr+KaqY0pZnbzxObJ8fQ86YyCAX7o/WQzE0nKq6e4R7GivwlaABWC1XQnj1
	5s0XZdCHC9moY2/bmDVuY743XPn8eqH1UsVA/V3Gg1VcDBjM+7EUoByfJW7Bxw3wstSYIQ53D+g
	F+iz0wMDqqF68QzZZdCR7WIziq0Y0Xw5Ww/dDTl6rOPDMhYiQ034=
X-Received: by 2002:a05:620a:4809:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cb7be3b578mr1561791085a.7.1771853876033;
        Mon, 23 Feb 2026 05:37:56 -0800 (PST)
X-Received: by 2002:a05:620a:4809:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cb7be3b578mr1561785285a.7.1771853875469;
        Mon, 23 Feb 2026 05:37:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:21 +0100
Subject: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y6cLnzxLbcY4O1vy1l/Pb+kY447eHyffEqOzNMSh1VA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgfyiEhvnOTuwabLoouq5gojp7xTfxsNoS9b
 r4S0IUnXVWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHwAKCRAFnS7L/zaE
 w/7zD/90hs0mBgYKZcCh91ZyjTCM43x7ieC4F8bbuC/Z9ltgbbCOKLPt8RJvDtLoPCNCggR4EIs
 UZBmQG7mBKXwLosmLYnPrDP9WfPHD5FclsLeqz8Rhgt7zH+dNSz+6xTtKUNIix6ApcaYzXhq/1P
 2zQdSCpdD1rFaU9VmyfHgIjYdNwBKyVd5Htftn6rRnB8FS6JEokeNC5zVnEnm5A7bS2ilkhnJqn
 cqu5BLRwPq6G4reXHnL8XidN1j++El+uHP67EnZKbGR7OOisUCDQhmWbi8lNS//6MzjGnYb9NLu
 wFrLKYN9Ssfw3wTW4VNqE96aYE55vjMaKUAbkb8Z6kc8fCaGe/TtD7kuYaq5OxCvAvFuXK0Veye
 YbqPztVg/oVDFAJ9cKhTjY/cudGxJOEQTv4a8rzf81gi6QqGNWMFVspOfQZT+P1JsszrMwRP38W
 FZdfsk17TXfvet18kfZTFUhwTNPrHDVdnAa48bc60X+dgcolYfTF0NzZIuQLUDk6a6k2wKl5iY7
 Xbq0cA4kvkV/YF1Lrld+ZFyLm3BdSH2DERrUJzHxU7i6chgTZ2JiAQ6bKxYbejIM+MSaJXSXTlF
 Tu+EZ10ygw4wuVz5pazqWqyZH9dzg02jF2eFjraffWWO0iMiaQdyaTXAVJTapE6rjmTGrOvy98k
 dGFX1GlgUYFZo3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX5rRKXxI74EIr
 rKUzJdRtUlHJYWLg8/bLi8mLlES2yqV4vQ56IC/R44sAYnsI9u1Kq5oaFSzQz3GNedWdCauVq2L
 i3pvuxe2jddcfTMW5zQW0UMDOFbpGec/9GU3oFAppjTH29Y9zcayVKsLpp/T+smR2jlyKkFJd/B
 fW8OthjMBAyEcDicfxu6DxBd6/XG5kD4n0qyIIDhO/cb4IDuETm9BxlY2uonhk+rP3STDN53uBY
 6dKYkYy3j4iDrXLx58NtBSsbOZFrkjGG1SSY8ltCnlVQMGgkEIY7MAiWbjC3n6VNE2mbsQ/64b0
 86VotzC3VizafVJ+JiwwQdaK/yZzZMVKugLWfz6QIO1QhRdMyUHLXfAtbTpvKLKYeNwLUW6GkRk
 UPSt0TDmjGypRQ9IFFgLsBjiWdO+Z+YJpcvM8hzAc9C25zIYMc134GefBp4TRIAu5qw4e/orrWp
 yhqf1PzljZb4YsZsISw==
X-Proofpoint-GUID: XnOfLfY9F5lSkFCASK8Ix9QMu4nObJIF
X-Proofpoint-ORIG-GUID: XnOfLfY9F5lSkFCASK8Ix9QMu4nObJIF
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5835 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=755HHWBoX-NvMu0yvfMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053759_140921_CDE19454 
X-CRM114-Status: GOOD (  18.44  )
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

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx8m.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 8e2322999f0996d2723768469c6893b0ea22eb9d..77763a107edbd11302017e3f61ecb4369fda1ab0 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -226,7 +226,6 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct imx8_soc_data *data;
 	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
 	u64 soc_uid[2] = {0, 0};
@@ -244,15 +243,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 
 	soc_dev_attr->family = "Freescale i.MX";
 
-	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	ret = soc_attr_read_machine(soc_dev_attr);
 	if (ret)
 		return ret;
 
-	id = of_match_node(imx8_soc_match, of_root);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
+	data = device_get_match_data(dev);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
@@ -326,7 +321,7 @@ static int __init imx8_soc_init(void)
 	int ret;
 
 	/* No match means this is non-i.MX8M hardware, do nothing. */
-	if (!of_match_node(imx8_soc_match, of_root))
+	if (!of_machine_device_match(imx8_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx8m_soc_driver);

-- 
2.47.3


