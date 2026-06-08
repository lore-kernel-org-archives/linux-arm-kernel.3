Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD16DCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=; b=AxPScNCjLonD7gNWB1ILWIIoqH
	C40f01TYSBJsN4K+S+93r7B2KLPVz1TsSU9bu/NgKLkcYrT3MaDlOiIkAttfSP40ixzTwA/uELV75
	10MnqI3OlhExyEg3DYf7jlmLNOggNl4u9N1WjBtyHRvkUkTD+jZfhCqKgix1YSwOC+zHB0SQdRs3E
	xE7SDfrcq37XFfTti8/L0d9yiYrS2Jr4lBpIH/2vz9vyen30PRP/fzDmRJwojK+MiXc1sFeJZfZ0q
	aQuxgQkkWmBqGW/+Xw73aPkdNSYI+BoOXFGS3YsfLeokuhWpuW3c50SLLaCZlOg+2EGCzhKVoleNs
	VFHxcscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRa-00000003fQ4-3uTj;
	Mon, 08 Jun 2026 13:55:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRY-00000003fKZ-1MSW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR4H93782988
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=; b=HdTMgbz2z5FgTqoL
	IfF56+idyL8eAcP8L6hXXn36m1WesYiTSoIIV33hhmXCc7Hlv1ZtLGhUk7EtnFKK
	H34ZGU4hXYs3zmFWAtfKObOliuNBwwkYNfeGJZeoT/R9R1e0V7bI6cq/EOHg/xi/
	/vmzCmOjypKO/DzYmTY58o+tbGsjMzZoxoFPGl2J4QlPpGNPrZGHLtMk2aBFErBN
	vBFTx4Lt0dGiAaBzc6xFt0nL833sR5dFPz0KghgP3N9zsn3ozbkqAFOx1+2n/aP9
	B1Y0vl/COLI0LN9Ep3/qH+i8pStCLeENyWIwSGd7OiBcmULPTnmnlTIU3EAhfTOB
	5y1fOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee06t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:55:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176cc5bf2aso57878751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926906; x=1781531706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=;
        b=UlOo7BfnYYZP4E+xYVYD7ccbJGUM6knHm059lYA+hbX+hzzr7BBSca7159YlX9VxyS
         T111D168XjaeyT9N/CyYN3Jij0PErO5PMuvOrVQ/l+nYRRedYwIGg5i3KLh/lyfpH6xQ
         286fE/SUqko1z07aZsAcFuHZo8Fe/Gj4QRF3eUwVAL8j00JeT8wQx0V71ePqz8o2kBtR
         jstbYm20VGtdjsaNidXDhGTPp7ch2AmxJu56s1rkusn4bIrIihfETq76leQEO+Txoz5h
         rE7WiT3WEt/k+4nLXuiEoY9C7p9vucUxHmsyb2HQXX6gUjKLbocSaWl1fgoT4a9UKEBg
         E6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926906; x=1781531706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=;
        b=MJ/VgvVJchz8uuZdiCiL6F3wDBuKrWrjkWCKQP/WCbDLE+N6cAKuvEWOMmeBc+Zf4Y
         lUKcLE4Ghsu/l2ITnDtJNj5R+4rOYsAv4hproQasjpzXdxXSoOq40vYsLxULqSlJviGv
         IENxGOca3VC3bzykuLA/xsa5gKisITFk93GzSVBPZ85XDUmBA+ZvZgfDGsihaVMI7jQb
         hvCYXZbLJvy0qa73gt3g/RCRlH1efrGDTtgsU3x7/5lmfhJ8PiDECFOTiK4Zjt25vAm2
         WBZEEj+o+h+ildsHpR1lYOL4nZA5mUvF9cpBr6dnNP95b0pmxAOMhgKtmw2sejyKKCGw
         Bz1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UFs+C8Lh37Kep2yOK00aKYZAgw0+ebulLS6C3M0VpuqlaIzApk4t4PrBaGNOhKJiu8Uq0IP4O9wd8sYeoN53i@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq2eyr9rWlYMMBO/Vg0xmAoVpI4SkDev8Zii3iKapNYCYWzngb
	HhTWdiyI1cMb2j+mRILwzP7ZUxPkdpi4cGtb0nV2BPn9ntafUtY9kbgAot9MgPNfgOWwMIZCgYy
	yNhwp5nNsd1DksajULtmBgjI5dmsMJ/erXPH+yTpxWikCxnebPF4lgu7qj7s2FDWnfNR0n4iW9b
	fSvQ==
X-Gm-Gg: Acq92OGahq2Uqqwi3SBectQnI0Vsu97+AhKCdFbJ5jzsL058LXZahoW6PqHlvIuFbu9
	NpPCsvAJXagnWCUJtHukXqnAbpHxQIpOUNXREeuvntaeT7ILENV5UzlvPeCFksgzi4ZiKmSUYYh
	Jter+uQbaDAS16+EuhBgU6JKda6vNt/hpjlgryf/CJIlPkfwmkbdf/hAHM66PalriDxqX7t+Nj/
	V72VFPH3XbGuygrche8ziLx5pwrR9SVw5IJLEVSxVUUMguIv2b8Zas4lQm+E2qsnV1oGg+aSdIM
	Uum1aCqMjWVepo3ZDZRYg75EaxbfHy1X5Zz2CLVRTRB1o39IoLwFovZVCPdxKoRc6xihEiUr+vv
	kDRlv3hCWh4RYd5B/Ii8+8Muo4o20Wt6ZT54pCN7a4qFKgtB33/LpQeo=
X-Received: by 2002:a05:622a:a593:b0:517:8d40:7c7d with SMTP id d75a77b69052e-51795bcc230mr212098731cf.29.1780926906460;
        Mon, 08 Jun 2026 06:55:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a593:b0:517:8d40:7c7d with SMTP id d75a77b69052e-51795bcc230mr212097701cf.29.1780926905723;
        Mon, 08 Jun 2026 06:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:16 +0200
Subject: [PATCH v2 3/4] dt-bindings: mfd: syscon: Drop custom select for
 older dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-3-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5410;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NcitNjSkfQ4OyFqHaqu6E2atNqkTv+Y4lzGwlPttZho=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmqbJ7tPK1z7PP4+30wTCt9SdFWwHN6Wg/IE
 0IMZKMvJXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqgAKCRDBN2bmhouD
 1xXiD/0bvAbsMwgDv/iH4GOjsfgkjcx7enoDg0cJsvLNFtBsZd4xhalxTE6gj4uWHVG+J3bMnDY
 /SuVoxEhMQKQSzDGj8dNgPWN3QvZNloqownDIyQ72QsFUyRDfneqMVNay3LZ6woDjSievDd1/k3
 4STlk1kmydDgVDcFZrgNl/tGsqrHHceTIzSM04tqPfWfwqMZ/EFfSCVuUAQGHTDYu0lpmt//Nbz
 yO+9k+ou4/Q1AhLWrk7Iy+JE9A9NPktJXArYdBZ2F2OoG7o+2/VNrsxzUe8/cD2sMnhv112NmKF
 TPBfMTpHN4dSEg31hysiwDat4nyJnm6QE6+4KcxOGYs8BC7UsnWIHYyTqdTrGchS0M3ZL3MefH9
 hczo4x1VTv5VauSXHhxYdsFlZQWljOy1QyoqYPNxsT5VedI4hsNtkRH9O6cUOmupz30R7dmlMs0
 HByZAmTh1qZoMpCIyPoYHEDIyuSeAJxG+9NyuwEI/eXF7+O9U24puo3V7hJ5s5i0Ssl1Wn0G4yt
 oFpCdCzNYW9B/zNdPq0CdBqEjId67pCGUXTpoHvatrv3/2pkB1jzjd7x/5/RdqgX/A6VLB9aFhN
 xT8WWq33fnRaaankrv6cL7orUBusK3e4Z6H2baOMbH1Su4jSwVwUhVkHIAYCBv6NEtBqdohMpLj
 i7QkXmR6twBaQsg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX9gQHWAGjxheM
 MBRDCO4yYuubGCAiS9u+7hNcBu3md+bfI6W308PR+eOqCcmQ93puwQRi+zytc08IgT5OLmPnu93
 hA0I01Tt7JFQu9zKcFnxh0zVCnd4Xam0CXPzfv+OEodk8nue6N0iXH3k43ijqiAfQ6ueUdswio6
 cQ9F1N6P1OaIQfRS7QvW8Ha5K3xrI+mPR5B+vfFKXvtnpX2Ew7ydl5/LF6euj0418zV+U0RVpnH
 N+5Rw10+x8zglEtuVHD3tYErC07YjC0FvExi74ynPL/u6jbvO9G+2L5tNvF/v6lhPzOWtELR7SU
 AJugZFHN4cIxnnRIwWbDUqNJTYmHh3rJR2Z4+cshGnIMqbzu0V9m8bKBGey7Zyu8iRa3bkE6okG
 q08klQIjWVuA1pwOK9t5QPx5yDjC6tijO8BuzEqVwJWqGFLNX28ng6Yfe9Dcm5taTU1/CH633UU
 Ib97sgu1KiZ1+xB9OBQ==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26c9bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ADPNn3lZBn-UiSoLXagA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 43VjlKN9ve_nmu3FkZEs3BaMFwUFO0BE
X-Proofpoint-ORIG-GUID: 43VjlKN9ve_nmu3FkZEs3BaMFwUFO0BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065508_484356_39E43E96 
X-CRM114-Status: GOOD (  14.24  )
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

Older dtschema <2024.02 required custom select to avoid applying this
binding to anything having "syscon" compatible.  That's not the case
anymore and this additional select has two headaches:

1. Duplicates all the compatibles listed in the schema.

2. Is error-prone, because it requires contributor to add the compatible
   in two places, otherwise the schema will be silently ignored.
   The select list already misses mentioning compatibles:
   mediatek,mt8365-infracfg-nao and renesas,r9a08g046-lvds-cmn (with the
   latter being reverted for different reasons).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 116 ----------------------
 1 file changed, 116 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..b70018bf1bcf 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -19,122 +19,6 @@ description: |
 maintainers:
   - Lee Jones <lee@kernel.org>
 
-# Need a select with all compatibles listed for compatibility with older
-# dtschema (<2024.02), so this will not be selected for other schemas having
-# syscon fallback.
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - airoha,en7581-pbus-csr
-          - al,alpine-sysfabric-service
-          - allwinner,sun8i-a83t-system-controller
-          - allwinner,sun8i-h3-system-controller
-          - allwinner,sun8i-v3s-system-controller
-          - allwinner,sun50i-a64-system-controller
-          - altr,l3regs
-          - altr,sdr-ctl
-          - amd,pensando-elba-syscon
-          - amlogic,meson-mx-assist
-          - amlogic,meson-mx-bootrom
-          - amlogic,meson8-analog-top
-          - amlogic,meson8b-analog-top
-          - amlogic,meson8-pmu
-          - amlogic,meson8b-pmu
-          - apm,merlin-poweroff-mailbox
-          - apm,mustang-poweroff-mailbox
-          - apm,xgene-csw
-          - apm,xgene-efuse
-          - apm,xgene-mcb
-          - apm,xgene-rb
-          - apm,xgene-scu
-          - atmel,sama5d2-sfrbu
-          - atmel,sama5d3-nfc-io
-          - atmel,sama5d3-sfrbu
-          - atmel,sama5d4-sfrbu
-          - axis,artpec6-syscon
-          - brcm,cru-clkset
-          - brcm,sr-cdru
-          - brcm,sr-mhb
-          - cirrus,ep7209-syscon1
-          - cirrus,ep7209-syscon2
-          - cirrus,ep7209-syscon3
-          - cnxt,cx92755-uc
-          - econet,en751221-chip-scu
-          - freecom,fsg-cs2-system-controller
-          - fsl,imx93-aonmix-ns-syscfg
-          - fsl,imx93-wakeupmix-syscfg
-          - fsl,ls1088a-reset
-          - fsl,vf610-anatop
-          - fsl,vf610-mscm-cpucfg
-          - hisilicon,dsa-subctrl
-          - hisilicon,hi6220-sramctrl
-          - hisilicon,hip04-ppe
-          - hisilicon,pcie-sas-subctrl
-          - hisilicon,peri-subctrl
-          - hpe,gxp-sysreg
-          - loongson,ls1b-syscon
-          - loongson,ls1c-syscon
-          - lsi,axxia-syscon
-          - marvell,armada-3700-cpu-misc
-          - marvell,armada-3700-nb-pm
-          - marvell,armada-3700-avs
-          - marvell,armada-3700-usb2-host-device-misc
-          - marvell,armada-3700-usb2-host-misc
-          - marvell,dove-global-config
-          - mediatek,mt2701-pctl-a-syscfg
-          - mediatek,mt2712-pctl-a-syscfg
-          - mediatek,mt6397-pctl-pmic-syscfg
-          - mediatek,mt7981-topmisc
-          - mediatek,mt7988-topmisc
-          - mediatek,mt8135-pctl-a-syscfg
-          - mediatek,mt8135-pctl-b-syscfg
-          - mediatek,mt8173-pctl-a-syscfg
-          - mediatek,mt8365-syscfg
-          - microchip,lan966x-cpu-syscon
-          - microchip,mpfs-control-scb
-          - microchip,mpfs-sysreg-scb
-          - microchip,sam9x60-sfr
-          - microchip,sama7d65-ddr3phy
-          - microchip,sama7d65-sfrbu
-          - microchip,sama7g5-ddr3phy
-          - mscc,ocelot-cpu-syscon
-          - mstar,msc313-pmsleep
-          - nuvoton,ma35d1-sys
-          - nuvoton,wpcm450-shm
-          - nxp,s32g2-gpr
-          - nxp,s32g3-gpr
-          - qcom,apq8064-mmss-sfpb
-          - qcom,apq8064-sps-sic
-          - rockchip,px30-qos
-          - rockchip,rk3036-qos
-          - rockchip,rk3066-qos
-          - rockchip,rk3128-qos
-          - rockchip,rk3228-qos
-          - rockchip,rk3288-qos
-          - rockchip,rk3368-qos
-          - rockchip,rk3399-qos
-          - rockchip,rk3528-qos
-          - rockchip,rk3562-qos
-          - rockchip,rk3568-qos
-          - rockchip,rk3576-qos
-          - rockchip,rk3588-qos
-          - rockchip,rv1126-qos
-          - st,spear1340-misc
-          - stericsson,nomadik-pmu
-          - starfive,jh7100-sysmain
-          - ti,am62-opp-efuse-table
-          - ti,am62-usb-phy-ctrl
-          - ti,am625-dss-oldi-io-ctrl
-          - ti,am62p-cpsw-mac-efuse
-          - ti,am654-dss-oldi-io-ctrl
-          - ti,j784s4-acspcie-proxy-ctrl
-          - ti,j784s4-pcie-ctrl
-          - ti,keystone-pllctrl
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:

-- 
2.53.0


