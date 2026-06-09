Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EA3CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=; b=cVQAzLa/GgPjylJ/aYF9HCKygW
	Njvp3eigGeuqlsgMOjSYJu425jhA/or0QTVXo+LDMdslUwbH+bDAXkcoSooExjNX2aGoSMEx292tq
	aG2Lg0SS6o0LUK+rrw5hBUC64dSmmH+SLIid7CmxaKVVJej1Lmm+FSSk5s9LkzQcnN7o1FMpMTtJW
	z15CREqLanntGMQJci8hV6tZ9JviDXxWOEmsEVofsb8cjB7GupQvA6rxPa6eGRyYng028lrnLp2m+
	m3QCc88Vaoyx9xfouhcRYnjvXIi6T3Dc6PEDM2KgOgijyyPxRxKrQXAErYLo5T99I/Ufv7iT91XKv
	qQBHfHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5BN-00000006TRJ-1Plh;
	Tue, 09 Jun 2026 22:44:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5BL-00000006TQu-00CV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:44:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MECgY3503296
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 22:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zzd7A46gEHe0q2QQUgtIlo22
	z4kZx3py7wq1qUJgP84=; b=JVZX0trkHX/NEWC8ru2zdcL3JhWVjfWpxOKvadZ6
	GUwUuiRYCO1XQ4pbmYFZWr80r1PFWDTVUG/8r6eh105t2bsB+3H+To5AVLx7Wq+i
	xC6qzGdOzXuE6bqfpBgqIom0EylZ/CJ11IrGEoBBTNM1c9xQO7tdUPjB5z1fdmPR
	HrBMdCTy6yZyfLzK7UldnWyJ2K9PmZ+iQGVAtfOYiOnMekwnNxg8AAJYh72+KXFh
	j2e2fxGnauyCbfFzHvjjRJ4c1NOaw9zDGB3Jub/4YpcpW0yyTfNULqqwU8EMlfAt
	lEC31VrpNgUH5MYAOtughHK2WgVIbMMgg6OPw449Qv78gQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgm4ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:44:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so2551251137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781045065; x=1781649865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=;
        b=RLf+ZjBdPBNGOmdLP5ju6YnvDs22QdIemnNfbiYM8aKm5IrgubQv/PTKMKvOCl6UKb
         VtW4D6qMpkwxsXFPOEZrLMSo60Rqh+H6JQyIejLJxAP6zeOEORwH+ao8DIffr4bnsUOG
         7aZU0VODNQ23dLUtsUSx3rLl8dJa9BRznBu1utG4tGA/p3QZNjA6s9Iy6JnnE4IkLKfB
         FhP2WpwDPY5mcVLdr1HszGIM/8fa5YfmqBLEVqWLs44au/h4PFAwmR4RqoG3MQf2neUz
         YZWcOvkWoiZoUFsu9uk4hmeh5WfWUiBr74/uTUt+yCupL1zEIS4rcBv2/DfDsuUOGeSv
         fJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781045065; x=1781649865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzd7A46gEHe0q2QQUgtIlo22z4kZx3py7wq1qUJgP84=;
        b=gx13eHOxdPustiDUwrg8tO+ZeeNAMHjTp4tMpdfih24mc5wf88yY8e8yD+TM76KHeM
         R/Zrd0YuO0YzefxUSpECvOw36aRfID3qzWbXMek/dr5fpI1usQEb5aCT4VwyDonEfpN9
         ZZKRIfncbkudvZOl789lsR0469rgyLcvw/vMnoyr4X0ho/waLF7yHVz7q8R7DU9kvsGt
         KDbcE73FLff/SkwENpL2uxvWWvj5qE+dQeNzcaGztvyszBWm1WK2CkTKCYBjByw3Bymj
         Loy/XMwXCpoZekmegN6pfV8iA0eujn7rUSesbIoff6lO6VOZIQwDDA71ZLPWi3LW72M6
         tI2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+K6zZLT8J4TMLuITAezUtit5cUn4+/LnvQr+ur3jbGH45e6iXxfGdpO6u1po6oHp4oFV4V35lRx+uGAlr/C0pD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx76coTZKztgCZpUa0vdx7klyEQPx/ETFI1NRU1bVvdpXhxxEFQ
	A1GB92CI8zwVZtONWtCbBE1+f7CdDTWKy9azw5remmHDWeaQu3QuCjaCxtxAFmYlOPpCA7vAz6d
	iID07rtvzCZfAsMg1WBzRak7ItJ2Ul5hTvqXX+2GhK+3I/AU9cn+icqs/7pwJUnXwME3JSXJs49
	7F7Q==
X-Gm-Gg: Acq92OFU+EU4Y4CDIua2UzUZUDxcu04TJ3cNuyBp6J+Sbs1qSqniRZL3uvv9iuIho5g
	qnDWSb11F9ATaPsIfe4QPFLdFzbpVCeVMrVNj+syM/oz6GGPw4WIJnraiYJ8AdrWwZXGvXvhRKx
	BQJqFWS+cBRCbtmrIdLeIEW2z4jNHEw34Uido8FMw1uLJdr408+j0+PxWoh7s70+2zMzUYHcs6f
	+3CNnYYeaNMKMYKxdISgJQ/GFD7obc9Y3t8cbsFc9hONCFAKZsUEcrPBEVEfsuJP0z1vxI9h0xF
	JMiHZBLy4+hv/XxlbeZ0pUIcds4lb/8vB3EsRsf5MqGWHsJ1vYcqdc8riFhqmr9yx34kvq30ZGt
	8lkBLMaVD7VJjCmehvIGm7ZLml2q2pbMqU4RokUrnJyMEnAFf9kuJ9L76MI/M9AIVQZlDSB518T
	WPhpRYsg==
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-6fef26ce86amr12937899137.0.1781045065093;
        Tue, 09 Jun 2026 15:44:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-6fef26ce86amr12937882137.0.1781045064675;
        Tue, 09 Jun 2026 15:44:24 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ec0sm57509621fa.33.2026.06.09.15.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:44:22 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:44:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Message-ID: <nnygotjru5ximoea73xhqwfjsjpditmhonvf7lmugn73dc3mqb@rl7agcusn5i5>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxNCBTYWx0ZWRfX2OA3Uv8o4MMJ
 gRw7tYuESO1yzSJGwlbSnDAHsIznrDVWbs7h8pAU0f5cfoZahTBpPEWxB1eruXIHk0QvBPK104s
 +iTLOrVmRNK3P4TMH9ZqlLmzutDXOXyX5Dil4cQ9DOC9WlVKlTJUYQq88nU8ZBx7cTvKu/M/bL6
 Kq6SW3XQEM+0TQoZuzsvEusxNY/Bh0cMyfYpLLfnx/84FYwKu5cv3v+52VGp51DcNmyj2VIMgDQ
 U7Htvkr3YNdYoAqy2smuluRNg6E0BvOI+3hlv8jqt/wF6e4iAB1ji858Rvhskupto1rdOUF7NbB
 lNzsucBFocKuMVb8G4DKXpdY/uw71twuY+zJbahQm2JA4sZXn932S7xwsvBkUTBU9vMhHeOLZqh
 vZuqVrENOV614Gc86VQYeEvBNn1MmajSs7jmB1Rmo4vW6Jf91p6UAdcMPUFRlp2U5ZTCZNbZWyF
 mn4ak419KsyY6u718BQ==
X-Proofpoint-ORIG-GUID: 88lhKY4QBEL4IcXzQXGKl2oA99W02UKq
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28974a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_Y7Jz4vysGH1ZB7Bx6UA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 88lhKY4QBEL4IcXzQXGKl2oA99W02UKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_154427_069464_E42E326E 
X-CRM114-Status: GOOD (  13.29  )
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

On Tue, Jun 09, 2026 at 05:32:36PM +0200, Krzysztof Kozlowski wrote:
> IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
> SDX65, which are 32-bit as well.
> 
> Do not allow building them for ARM64 to make built kernels smaller and
> user choices easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

