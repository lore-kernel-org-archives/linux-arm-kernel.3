Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237FECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=; b=NDaxO6lcXTDOlEY7nemHlMlB1m
	zcY2nwf9spu7SbmRql9/3r04/XM0zkzd83aLBP/W0iyDlMHOoqTdunQAa1nadrnE6MlKGvOaETLB0
	qq/sEO1lNtaDMWAzWC9TBAUgGka1dkznvpL08UnneVTcbJrWxtVefJxyyByGmAkC+61SYa3pQZgT/
	VNIJlPWyIeLtW4qpSp+F8v4VrioGdzVGZwyM+ROgGqrCeRGOPnFJx1BM9ZEGEYGH5slv8BgIXO4L6
	A1tx5A2+RBN57potia5hWuv036VwVbv3bcAF10S7wJvMMl7EKyWsDQKcupl/dsnOtTkBSoCrNOfG2
	v7VAUFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTEU-0000000H2zM-0R6o;
	Mon, 25 May 2026 11:12:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTES-0000000H2ys-2DsB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:12:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6rtl21842262
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mNbFyNHd6yc6F3SvZBtMoTUR
	fXgxrtQi1GfKV4+Tz9o=; b=C/Zg3n6rQ0L8MoUFWRlOYVxnkaPKV8yxzl83gPLn
	qpSCjIgi4LoaGGV+qBRYhq11ZyWbHBoZhyCZTZ2ge5UqB8VmXL0vbwz2BX2xQnc0
	cJqZFc871NmipAdt31lwABPG8c64qh0zZJOVW0QCbSo0/ZxeKglt5lnfVxyEc9Gv
	vCvzMguAp0WwuRCOFqgBf2ADM53/vYEgBUHkJVZfPLXdTeIcd50e2nKVE5Cp+V9S
	O4SWQgGqKo6Guuo+kzn1gPyb05OezPajqnXnS5Nb1sSRimwEXlHGaTvqhiZQY0ZY
	wHNtvaMb5tm4wvqLLOnvaP7r3hJIuOn+ELNwGLBj2aYaIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wk6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:12:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d1a8a6c8so21835391cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707547; x=1780312347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=Ol8L5OgK5d3RPvjvqhAX2CIWk8RSaXeXZvleZFNy0Jl3eQgw+HT4udT/0R5cOBDkQx
         t+4M/buAmezvaF/57etv3DgzBggWE33++ORjooVZSmd+9VH+3fwiKs0gKkt0WSfV2OX6
         hRZ+r1EZuI6Mi/P3tGqMqc9gga/Q4u85kXYzBK5HBvUir7SiFX7aXlmMKA8SvzNBDVjo
         UoF/mXNOrsnP+VuVYaK2m6PMNVz4WyzhFYy4l9FBtYc2N0sQYnX0GrDIlCXQmsrXPhYS
         2kHxiU/I6hYiXiD+RThDPJv4Ht5PuzOtaNjkmrUaIKZdOdAeHjXLA8yK/sNJbJ3I9oom
         6cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707547; x=1780312347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=hyZoOp7CfniuP0+//GlwcdNe0cMalhFsuNclSMXyGNJKLB6yF2/T9p4l6H78maI9Fz
         pskN5E3jjj1TPNsJ8N4ZthqxOU+GT/sVv0TeIqaNltjMF+jo48d8Cyuv+HB5W45ICUZM
         JRrDv4wGoXnNIkg9/n5QsQFOL8R34w7a5xUSb/OCFm07g8fUl9KmMnBEYVDV2MFQZrzK
         KEvGb6R196oh6lrZvOCgut/r+p8KR3lVfBU0j7sJN85RvRTstcGNbDYGaNUw03TY4fJY
         y46jYwZ6bYuBGvIRveB03Bctng5dp22CJYV4wolGCjGIiEbGKiPHpQDgqJiWqJm2eBQy
         yyUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NgAy9gerX9mwyxv81Y3R1FNydr96VRj5N3e1e0ZHwrvGHEw5xTeHT2EiHCczVYLyQ/NPTZiLLCt355q848nAS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+yoLWW4gxMnjHmQyJSrydnzYh2OW4kIeclL02q8Dtu7Pl0UQp
	Gbp9jUAkMd0TFoZaCUxadf+qwEhHnuA9A6uiOkuymm4ddrF9Q6W8AuMvfs5m5ic3GJsC4Y6Y7Z0
	42WOIqNpUzSYPKerqy1wHwM2ukIvE9ZVVdvMxfoAfrp+5kdnYFJWF0tyu6EjkeDKPedHuTcPrdP
	JtzbUBeVs7XSCw
X-Gm-Gg: Acq92OEqDBUwUzb7PCXqbPpUwima2ZIdGIZitUWz56K5mGQk5DzbqdMZoaFwmLC8tSD
	/M1Ra6rbZpZIs8YlbetzreRP9zSwtiOJ0rXHV44aTpK2UL+mwKqDe9F0cFGo3afYPiU6wd74hV7
	VYk+XFIG4xPTAakoRAWZ8g6xG3pvU+gZkQ0ZXkK5VtkorY/OL1ayKmRApR6ONQW1LambYWUvdN+
	NFfN9xlr+P9kKNthUzbBJbWr9NihI7ogthN60ho/7etJQNUqkwbJep4ER/PTVSZzavec4eIwe0l
	Yrdxu/GtO8OWgnt/kZSo6LI5UhJuNWy0KtPM1ToPK/DoDJOOc0Yjll2M6Au4f8LIXYvXfDWmlIL
	nk/PId7IMQ80d3c9I3hE/1Mmd+ze+hed+evcJbaqdUp/rCZtvD2JQFxH8rCjwHfLB4oTM4M8Z7R
	o1+A7iJ3d42VjVliMRkloiBkOTXDjl2Fi1TqY=
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118409461cf.42.1779707547097;
        Mon, 25 May 2026 04:12:27 -0700 (PDT)
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118408951cf.42.1779707546620;
        Mon, 25 May 2026 04:12:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2ecdasm22191671fa.32.2026.05.25.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:12:25 -0700 (PDT)
Date: Mon, 25 May 2026 14:12:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Message-ID: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TdtPmJX2S2vWgioIgtYB_fOu4D_wRtwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX99sw7niYGpkI
 9LCdkip4a0lCfDYsQgA8BuMPv111HHEtW8VMUMsglyZ0hx4TyK/hycomOhfESv5JDTVrbRZYMIX
 6/kFN8ZQH4BcQn+jUQYFIweDZmdQ7ZpyeVWZFLdCSXjbwpOjrBWpxoQRIdx7xbqL4LpDhh0MmaC
 Gxm9jhdj+cQt4gHxsCB+b/Zi1Qs+fnYl6nFp1A8qVU8NUp33pdTjRjdU8wyJXahTqvSzgR88HM/
 0WYQFmbT5GBXWWVykBtjHTZdZP6GfRi0AlWiEX5Idjap5c0a3clZeWcAdpe9T18K9ia6bKe2Gmk
 DyeWH/HByJQ2ZWlSJjvY51rPYTXrXFNOXDI8gNLVWg0PBoXePLjZv/ts6MjOvNjQ0w+LNSoyQBh
 ZzQjTj6nUkYsRPjDYBmIbuxcoNzowFSB7KidiyAueJv64c9zyIRrmvGmOYbBVnJuDDu7W09az0C
 IRw2IdUMgTQdWOUiqig==
X-Proofpoint-GUID: TdtPmJX2S2vWgioIgtYB_fOu4D_wRtwj
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a142e9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jdZfh6YgxIVJxXzoon8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041228_570040_A44C3463 
X-CRM114-Status: GOOD (  17.58  )
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

On Mon, May 25, 2026 at 04:16:08PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Eliza
> platform.
> 
> The CAMCC block on Eliza includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig               |   11 +
>  drivers/clk/qcom/Makefile              |    1 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c |  465 ++++++
>  drivers/clk/qcom/camcc-eliza.c         | 2803 ++++++++++++++++++++++++++++++++

The camcc and cambistmclkccc drivers looks pretty close to SM8750,
except for using a different PLLs. Would it make sense to have common
drivers instead?

>  4 files changed, 3280 insertions(+)

-- 
With best wishes
Dmitry

