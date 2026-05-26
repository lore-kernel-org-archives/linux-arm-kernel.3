Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3C4CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=; b=DhGtau5IoCzssaFO/X4KShE7gL
	bUMWv5Dmkp9oV+7ue6CZS1kA72QG0uxP+1FSvyGEXI0c7u10l3Iw/yMTHZaUEYUCopqWksRe6iRdV
	rbii77klAodAQ5Jm+vwfRSmxpr5yIEYKIoc/2688GUTzaXyVxb9GmamoF0j2QnR3K//XmsBjRkVQ9
	K34pVeRPfHmSYea5Df+0DPhjs3QiHF2GUGheGieqQO2n4XcszgGYPmx8KnuRBWINrQJdAgDG/ez1j
	e98TizdWBeeSTCYlfO0W8U9bT07n2Cz5m4Gd2SLh7/sH4JrAS8+xNTf57eZ0ciueFm5IUuehNngjm
	COh1pJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmkr-00000001KbO-32Ci;
	Tue, 26 May 2026 08:03:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmko-00000001KZy-134b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:03:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2ESri4117392
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=; b=I1H5R8vagIE08hmU
	WSBnon9XuFtaQzsMobF+kemk7ZiRMYGRyhoUM+rSxAj86VOCtLLyytCaia96G0Km
	DvYa5Ghg31UYqZEqnLjbzmfmQFQAhhuRccnGq7d+2Pn94cl0NQ5mzijIc5657sKX
	h5yjoDFL3ft+fasKKp7OI96ZI5ADqBr7qpjICfqyRxWwxttxecJ3DJ5uw+rkbF+H
	EDxzl6u2vk3N5Ex21ci6g3brVmScw5pchhBiv7RZ2R3netcrBbXA5rbl4xy8HOFe
	nF/W19AH7ZQk/ELScUQRF9/mU6y4/qgx3t6g0/f2y3fHjBGjzeuRgP4s/nzc4LVu
	BMsf9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudastb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:03:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so286659961cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779782588; x=1780387388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=;
        b=DhsldZ8kF5rQaL01YszUyXYeXDk63JOPyhVOblJ3s+/18M9CH3pRjTHEmUhwP2dOw0
         vVA/yWsXfjm4UmTK//4H6WTEmZj9RI9LT7+85Pag3uQUsnO1Vg51qcjYsBfBId6l2rCq
         vUUgITdFETkHmTYJwQgcCFMJO1ef9x5SzWTRK4pOUAgBUaFYvUCFKbiOvQTvs8UmofMQ
         Iw1N+4sAXit2L5cZ64pDB4h8wBd0CPzppKdegwLwQ8I1h26WlZaXw/8a/4AFL8J6diYa
         ZEip6C/3NUY8p+8QSwFE0Ot3oqqxmUUfN8zHyPcKCCVnoUkQXeWIXALmurJpQ9zavdk6
         modw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779782588; x=1780387388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=;
        b=GI+FAXSSfOnaDexR74vdlXsVVFTvFVn9SkheyLYwzvr8/NaWZjN4Lrf9Cbi7Nenmja
         Sj5bOQIGrXNmrZ9NEvmkGFWXLBtZMWOKRLnjJWMf+OE4jO1LkyeoP7CltUi3Ok05YiUh
         ATi6L9ZvIVL9fFhnQo3Zsp1mc4yQU00X6XxT59WBX9fLQOpiNM2N5ypSmP1mLHqpwamI
         YYIi8+3GSfqH9w6Xpy6NkAlq7W+BQMeLC45saKWkhj50J1/mWahQQa55rBz1p4gmWO3U
         ih2at/+e9OjuHKO2ly6wjXG4fkeSWBctSLJEANAEM/mc1lOrOlVfQJKpzrl9reneesf2
         D8wQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CDmLgnLvz8ua9TVcAJwF2xq2wpuMZ+lP0+VT1E7+tt5Z4ahOzzFP7dnC8c8Iahep7EmJriKLCFv6JVfjC5Ejd@lists.infradead.org
X-Gm-Message-State: AOJu0YwQP3QxZS3oTekL+W9ShOBInMrjoS8N45jdXreIbmDPd0/AGm25
	UnwJnYmemR2Rlqy+KfuyH5weB9FfCvBXMpruk9XGAVt9Vi8zn1YIOmoAqOz+q2Wb0n+04l7P9l9
	oVaoJvTykV5taV/X40RXmZ/BWo93SP6Iv/yRCARoPQ4MG5f7Cvzx7mJDrl1Vz+No4R9+FYim5Sx
	it2g==
X-Gm-Gg: Acq92OHJWyIx9EfeioG9P1JEVFinWQ3Mo177XN9/uEmGWg/4fmmHR8Ly+38LTPTu3kq
	B5oF8IYOVdRv07ZXzr0UuF/JGmuhnvTmpv3qHHDWbHmqSG9ocIdisGzcEiIxiSWp3LHCLqYc4zk
	9IoLLZvgG7mfZfRpbzaWExc1b8mPFzORy9g2Y0yQm23XSenI6IPTfspgeMRpLUXCICxJZV3QGAp
	uXY9oE49DnWD8k443HGMD27BW8ddn9VlsWsp7izcdpcorVCIweklEUpttz/9VgrposG/qrOEViF
	hmbHlMUJ7Fvl7ybtpmhK57Ah9ZmlkfCKbBxf80hQyvOlgBsC7ga2udpSiL/LUy+mU3VGwF0sQl1
	kr1MqjF0YmTGNQj4QB3sdveXGe1pPxR6ir1N7ZJAsBZ3hxTXu3g==
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr251537721cf.13.1779782588342;
        Tue, 26 May 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr251537301cf.13.1779782587900;
        Tue, 26 May 2026 01:03:07 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm176729165e9.0.2026.05.26.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:03:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jun Yan <jerrysteve1101@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Tue, 26 May 2026 10:03:05 +0200
Message-ID: <177978258287.4574.1235390656102820525.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524154954.385778-1-jerrysteve1101@gmail.com>
References: <20260524154954.385778-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g7Rko-wpOWJuSzf4kKKTMbtGkK-tUPN_
X-Proofpoint-GUID: g7Rko-wpOWJuSzf4kKKTMbtGkK-tUPN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2OSBTYWx0ZWRfXzrJb/P4yP16L
 cgSFflukWh27QgMj8T1kPCkpfhpdajj70pVBS67/z+z+cbkvTy4XU1lOJv2jG5kZA5pZRpq2uUl
 XaU++1OjCxrhczQ+PuuUsYTI86ndvLN584+qNyKVpON4s82VJEJWtwB/V2mUJSSTYjCieLxsUY5
 Ha/eeEurubJIrb8BKrEfgas+HNU6ibT0E9CSrhmfou0TCgcu5PUuV8RwtGA+hpNTZrFfmKwSxxF
 crTYsQ8Q2Zc6lxvFFWu0EK5e0M9RIoRilYMvk2a3mdl5YfhGS3h5IQTZ4fYIdJhLTewR/UxkOxo
 j+LWA+eyXTKlpNw0SNrYeQ0a2PD97KCCJW5oqh4CQFm7Og0gtSYMXhbgiLnUgIuijFJ1Aql1bFo
 oiFVUUQqugPi0Rs4Py1or+nGwaEd9ojFE9gkT6XDt1WZSY2FMUJr1QOQ87GXe4wYsHlofLBYhuI
 NrPIuEv2rhxEMrlvoqw==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a1553bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XSeIg-1IB2E2TqoohwUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_010310_395962_6A3F3AD4 
X-CRM114-Status: GOOD (  10.27  )
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


On Sun, 24 May 2026 23:49:53 +0800, Jun Yan wrote:
> Clean up whitespace misalignment in meson-axg-gpio.h
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: meson-axg: Fix whitespace issue
      https://git.kernel.org/brgl/c/820017813b818a9b6411e481fcc98f5260b6e6c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

