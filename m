Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E560EA4FBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=; b=JvXzbo/+I/LbldGoJXYFA1bZPD
	LjApvUwTllOWpgx2JPqbl+fsZcq5TnFpqX6vwz/4+W41Wk12UEufPmX2FlZegZaRZ6PNlmr6Nok9u
	mpf1lfjwgSe3ym4DTsVb7WbxNFrnr1KRY14sbmUxrYRn14VuhrYYgPeoTZSr+eO+fbTkDgStKjDMz
	ceJC8RPCNuS2PdNFX7CmcKvzA4bqFr5gJP2BfFsySCDn5YLscmoINEU4G6M4B9if9tLVPj4z0ceOX
	nYN4DmPzCVvA/yhxGYzV+URCG8FWmaxQjIvai1IpDKxw0u8v36KVjFHGaABJiSCmBLj0Obuzv4zu9
	NhJmJhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8N-00000000Nah-3Ufx;
	Mon, 23 Feb 2026 13:37:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8J-00000000NWo-1zbp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:37:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8VaZn2887961
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=; b=nzKXoOxi1bY4uY6f
	tR5QifCU+ODEzdpPNtpBb30VXXdbcFX5oPrIf32P+RL1prGWNb3WkWVng4H9wU9n
	RVWix+32OD6W/2RCVs6sC+7UEuzEzYC+kdAiGc4/caAz+S8XOBMZmg8w/D926Uvr
	sWKrRRYqMAB2cahVvYOEGd32s9WEF3hRoRGulqAJAqA9/7TeXNWzDB/OfdKE8gDN
	in3i3Aqf5bi26oi0UjSuhJ9sa6zQd7hdzCWDkeDzHKQDFk+QYcJZR83JC4+UnhVX
	sec+mtHcIBvBsFhgXbQztpfjJ6SgiXiQ7WnFWx8jQf2+7StJWGOcPFgfsQzv2EdH
	eeqPcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8mtfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso610770385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853874; x=1772458674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=FsAxKXLXxmOula+NdEYBles+fYKdUBhckUI47fJprr9eGddiX6hY9zBBHvwRaXftPj
         kyxQHOjQZN9vMYrrwC+wKlbDkAv5wxbjbNko/GinF2hTmNC9bIZDE/6aUmlv+0uy+4k3
         m5tv4OPZqLYP4VzHka/2lCpXlLVkSLNb+UuEcHsu8X6kaGvjK4tLmYS1z80stZUbjrON
         j8WCpc0Ho2845IUBXibDrrLcg59HLARamrWsGAjIzuqgzzzJOZHAiSsQHVAISE6owEiF
         NhS2ruZ3V6CGHvJajWx8nppNyiLLDgW+2p4gGnl6kMHWX+0BMCBUWUeOfsXImBOSrdho
         VETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853874; x=1772458674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=ichFC29g3SYfj/bTDNiBEUzAUl2Ryd4A3Wx9GRd9gmdeVB4AFbs3bf4wr0Mo4e4fsH
         7+uMk3UTiU/gA1cPazJjdIixnj4WZt2dHWj+kTaSRA3O4KVTVBc8h8CFdQGNKTDWAPMr
         eywpExiCxMLKFBnLK6gMoiQZlnfEkR9pUP0HG1A+fuD6UWEZGBRdFjM69kiAC+V1sVh3
         fpT8L6Gu5I0a1NjnyEsTEPjCc7878u3VgdX3icapsy14fbxlPaIzj6qygFtznpy6OROy
         rqEW9s4uZHk+FyUnVDqXww4OIR+eydwzQrz+D447Ju9S8I5hq6ioItF38rCoERv6F77B
         XDWg==
X-Forwarded-Encrypted: i=1; AJvYcCVt0aqhB/3GZia5244h2hIR8uKhze6J2WJqB8iwU/u99bZsN7wJgTd+yuHayrNOCabocTFa9yz0WV+3EooYNdn0@lists.infradead.org
X-Gm-Message-State: AOJu0YxbKWwhbawMxJNS9RWb7bnw27XxK0eoo/Fih7ZBzE9GQ+gOpEl2
	vdaxl7GwFX8gqnSzfIYLlZRCF0ZRuUQJfhu+R7cTJsA1bc2rNfs0vw47F9lkPZpvswBb/KegYK/
	MjxCa3ZhF0zOcTgX48diDDG2WVUQJSDpaeX37160CuaKswKyxcubBGLLHN8H9yQWviE0WU3OliW
	Cyew==
X-Gm-Gg: AZuq6aK9jG2GZV9on3l1z7Ed2MCGV208y+sr3zXboLrj1ylZBFedB/VJQq6hwsvozqQ
	DS/TfcRcY3GoFn+wikEzqY+dkTtJ/ar9tXpWkt3jOkmWYv+Qe0TCOe1oFKrVIPN+P17uA4chTQZ
	9fLVBi7KxNioTcrbMW01AMhuYwFQnYRvL41WIehE/8Y4kDAGavNKD+9DkENPmfzdUCZNf2ZUrsB
	xJJigLceEIcsb9B65TedFU4592mPRzJeICS2oG0a5hKWBB6Sdz8ikwfO3r+a5s4zM6VxJh/eTcd
	iDZKOpxP0ChReWYvkff0GqIhoXKit77sibnNWuAylznFbOtm6hsi12rsGas4W71kjzNi3qTgcDH
	PuChwcM462Xnkn/8Ch2pOy4+vy1TfddcAS+R/qk1yGk8thcpi3Zc=
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996161085a.51.1771853873856;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996158085a.51.1771853873383;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:20 +0100
Subject: [PATCH v2 5/9] soc: fsl: guts: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-5-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+XjiWoNFsFPVem7xRnzx6aq0i9FMhl7HvhAWwW/w6SA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFge4NKs5b/HhZf1FqytouviECXWv4CCayjyG
 d2GXKvSbGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHgAKCRAFnS7L/zaE
 w+AnD/9o82yUVcRX/EDQ8/rDuhAdTh2ARj4bZyZcBUwlc2QItKJYUxWDovnXoZAIJgHTPdXvkNt
 5jY1LxpMojb/ytP1LIZVcjj4CZeP576Vp4g+okrBBq0flZsfk+pjYhYudU7x0W+DJU8R2c6tMhR
 eg2aR0FEEY7kI6pdoUzDoLUp0Lnkw6maSVRVOD38LY/rOsdoe8H3w4pccAPnL6HkTwAAI9sRemM
 stnYdqeTohQktd73UDF3oyLdoQUlNcIMWGCdktfobl/DsGcWX8DinfBpx4PVxFwinDExsX2q23/
 FE5ho2KZlH1ccbvjFOugOdsnRZKYUHFsH8njc441CExac7ECXdL9lxKXh0DHGxPix4Se/UiU2RY
 48AucP0vyJT+EQUWm6t/KFhx1u0KsB0S/AZB+4anFOiTiCQdwi9lfJGE5QnfghNVwv/HpPyRaFQ
 GAkMfxvZ+klkP9uJQwDhHBMSsO5oOuiiYOx3H0/rP2uVjHhwEb6vNv1+7OXvvR3sDIqRONxFVIY
 sZQy7dQlB0NJCSPTZS5iHvBq6b6Px9ywpt1pFp896x/238b7PhE6HZdhE4SrNxaOx7/IcXkFEfp
 Tf51sYJdhHho5bc+m19NDDMTXN/fgysqxUXUF5QJliJI8uQutdcsY3juWrvuFIw/tURqSblK3aF
 tSSWnHAI3hqqIfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: l5kClm69AJCmOGBzkclgfjwq0CLb6a5o
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c5832 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: l5kClm69AJCmOGBzkclgfjwq0CLb6a5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXxdB6YkwFp6vn
 vZjd+clL/lGC/aQ3jFb9GtObKOl7PBHUWNuytGc0dMiKiuiPBCU2fv/nRaxk5nwA7svHhKsFdVe
 xd+CrM9E1CeU4549kzie+TZu7TZUAdJ5K7qA9/evKRflkKj6DoEXJF0AJCDhS3/k003HJ/vYDnk
 i+WRJ+c64u+w2p2cDeX7YDOpb54j1uYgLNZuj6sdghjsZp1g7p9VVpGk4Y3jKAeq04mU2cehWtt
 QOv3i/m3FNHfy0fYgPhc0qGP0MTp5PY2lgz83bKtgZMs28nVBq2aLiUqVpnHfcLQ/q/L3kfgRub
 LNN7rvnojRgGsySh/YvmpD2+mI3LD60DrjUvs6/1r8BRS9SV+b6nvDREYV2JftIVdaG/IejRLRM
 aUk332KDQZotICWdtiWVuX0fX3YV15LgXP85fudVNmiDZiQPxzi6KuC14PMwsfuffA0l15ZSbDC
 GLfRIQHFdJqVgEB/+rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053755_644367_EA9BBCF3 
X-CRM114-Status: GOOD (  16.37  )
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
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 40afb27b582b1bbea004ca91b96d0a998e7a6582..9bee7baec2b9b3a548b16661f9ba86db2b982910 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_attr_read_machine(soc_dev_attr);
+	if (ret)
+		of_machine_read_compatible(&soc_dev_attr->machine, 0);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3


