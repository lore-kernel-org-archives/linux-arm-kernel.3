Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD795D2F03E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=; b=vzr90LSfPLZFPVDhiVzIjpzNGQ
	emMlzjM4udnQ+6EXa0YQ1j4oF0GuMTzhy69qmEcV8qH07XMVPZLyahJ3m01z9jJTW3pwt4KZtC8Tl
	SIEVJXhjLkrKPlld4vCdgc+0y/LVixnh8P8kI81cbqylQRK6n/zAm7mL6zjf/zvwtYC3EVrJdVBRv
	/FXqrIwMubT4fipXfUm3Hso/b3KcnySEGCM8ue6QnyAHfMrVu38cXHIeNwa6I1JG8rsiAiiBe+Zhk
	VuHSe/Ao1CuB6GtZwjYp+CQkA4h+N7P9HnxZscSP9sPp+H8lylEQf6m6l7X2SWPb2kxXtyPP6CCua
	Da4W2gmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkQ2-0000000EThO-3gJf;
	Tue, 27 Jan 2026 14:51:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkQ0-0000000ETgx-0z6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:51:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RATGt8495967
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3f3IK4MOfniqkAkGkyLgogaC
	73+XOhuDYsdZ5+Cky8Y=; b=CCuADkywl5ikDoVanG3M8TUuNGVNchLUXloIYwfX
	8G7bksXhVJINjzlccOaFPD6CfVWs6cyCMI8g5jQKvuz121Uz8m9kO3+t4zaXegiU
	/deium0poeRt8W0VejetG+rqXN1iXIdfx5GfqCVN1hlL26Fce7mKN9A7bPlCDqeD
	1+J4cvzP67Up07z8gzxuWYRIyfK74FttEwr6A5LxbMT3ZzD9vwbVN6lDOG9PE4M8
	pUA9k56BLLi9e6cO5uUpgFthUAWBbnACY0DZRanCyTDe+6z2O3yCe0ixaoQssYzE
	z9vG52EFSqz0LEidz1fl9d398avCkvjYILjil70PzoEOew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bk50g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:51:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a69b7813so1598704385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769525506; x=1770130306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=;
        b=FJZzJr5ZaA+WcXXh4dO5LQ9XBZy7+toj5h5Ip/5DNPOF7QmGXooq+xSXgk8Zdnua2u
         kuxpEhdt6/wgULJ9Gog+29Gnc/HU2v6M6a3no2ofij8KiHourC9smur1g70JNZvCoAzK
         n/eSJENhlBD2uPYxx0Nsz9xPeTn4RkNosw9OVTXfsHhZZAyQ2OsfPJTqsn86Q6XNACHT
         PWjk2yL/YTWjGyYiYZT0gg0xl1we8nVoVwuHxE3Ce+hkFQQbKGxQAtYhj3cpvy3sAc6D
         tdTkYz0EBF3OPYO14F7paemBxMX68n1Z7fn9FCB1M1qCoJ6bj04tp9+y2HUSwFn5KbNC
         f1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525506; x=1770130306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=;
        b=jDfQxKcuiBv4pln/TmyCucrJeLwTls+gjJs40+0N3d7Z6oSpc2046MFiMrTNESRAwd
         c6UqF+NbnXLtFBJCwFPpC+zuC9rDUpYEbbFeVRHMs7CMPh8De7Q5blC1adPteWnkwx3Q
         U/t0icte/wSHfkxhIYdXL+JAz11ke/REX0M2FH+p1iC4i0F3WISzrEeAGHlu0zX4y17O
         1Cg6p610A/0Gd6d3q4PNawBL/FYf+Wzpi9dcJYPInknUkXqlQ3CawIYM5gA01JrcfQ1O
         MZLtcYWJB0cMorL2Q4znlPBg0SpYW2uRIkiDJ79wXtlg+Z+D8CjMI0R9ytNqfETlmW+/
         6nhA==
X-Forwarded-Encrypted: i=1; AJvYcCWCmnSGfmBn8jXSaGh1bE5z8W+4g2lEX8KYn2MhvX9lutdPs9ClUwyhgdMVSLeTcHW4h0ur1K2V/EQwLUyGpKVE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9s6BYMdLlBBx5F973Bu3Fs84LT7P/xGXMctvy9oLBYwDfhkOy
	nZa75wIze/FBiejLkjX0CBvwBaQ6ilZQXI8fWnT+zHAKl92n0qHHbkVQzgi1mFpXD9+lkaoAOPc
	Tf3rH7az6CA6pgbPVI2m9uJ2vlqTsLiuc1nVVkLEDm7tU9ZvvGOMPUWxB1eARO11BWMYyw58vON
	IhNg==
X-Gm-Gg: AZuq6aKmF10/n6EgHvAxHe33W+cyKL2sWlz5+4u7rTh5DG1WSMluXDM0DZ4lfx0vsDj
	+W7AeT7mY8cS4RrcUjAmYeZSeUbuYhqHMAYc7zmIgzHl2IYg68UdKTP3olD3CoUBymA0g/pM61P
	UvIzJF+Q05o0vPDoOjFrexN/KaGD9nj0HBhOnbGvse13pjrpn34ZnWngM8bpQd2b3sR20tilYQg
	oyIIo9XRw/vDm2BUSliMaURnoj1hjPzEG7xIKp2y5ACEKr5AJQhRgdyuseI4USkWOjJWG9rMX9Q
	xUSMRNtaPNiHh+VZ+FkEebEDZP7NwLlQVhwpiJJTcfFZXp6WuI6k4fNTaj9V+N4bHA5ySAeXnyP
	+Na+eO/lnsFgieAET6D4XiFsz
X-Received: by 2002:a05:620a:46a9:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c70b8e5f84mr208882685a.42.1769525505688;
        Tue, 27 Jan 2026 06:51:45 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c70b8e5f84mr208876685a.42.1769525505004;
        Tue, 27 Jan 2026 06:51:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d61f1f8sm133530425e9.5.2026.01.27.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:51:44 -0800 (PST)
Date: Tue, 27 Jan 2026 16:51:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <b3bv7uevrk7c2argbhyxohhbcn6xtxvrj5fa4jwjdp5ymtinza@k57crjsa4yn2>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
 <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
 <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Proofpoint-ORIG-GUID: Oq7Kp5HbJzruULvXvNwbTv83_bgOMpqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMSBTYWx0ZWRfX0JcL5NJf84Uj
 KUFFauosy/GsZCsjOeXqaEKhbKPGNm/pPOxjGQduYQTABGN+T/TvU28HURE8oql+/h3rVEZqrPU
 NEA6BIx7sx2R4GL0TgONNFqKb5rq+kW+zWsHsytQa61mRoxPvtCdtX4oaiA2CI0X8/dhU5f5zcI
 7xfI7OPQWdNm3MdEgx5bhe1YJTqgqtpoRhAVkgNW7igLUTotCZXyRUUmUZp51PRpKh3GveP5n0B
 t1Z5aSD80krril/lH0Wv/e1H7tYFVrUaVo8UYyqwRhzNHLBUyLdqkBnao7iFK0NucVI9izs5uln
 qeZFS3aWsFkiuE55OxRhX2m14UbIoQYlTzwjIsFZg5o8TO+iQx4NzaUVhJ2esnPZnQaeJPYvXBX
 cBmzWcRFtpsIQyOuqShBuiRCnoJ2j3pyIBV2Q3nbcIu3Ypg7UkJJi8fU4FG9XBwaYSd8md+8t2c
 fRIgX3l5iQMZDRNO1gw==
X-Proofpoint-GUID: Oq7Kp5HbJzruULvXvNwbTv83_bgOMpqh
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978d102 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=XYAwZIGsAAAA:8
 a=uB1rFwlgQs9gonznhjAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_065148_308046_792F761E 
X-CRM114-Status: GOOD (  16.60  )
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

On 26-01-26 23:31:12, Peng Fan wrote:
> Hi Abel,
> 
> > Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
> > optional clock enet[1]_ref_pad
> > 
> > On 26-01-05 14:50:11, Frank Li wrote:
> > > On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > > > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad
> > for
> > > > imx6ul, which input from ENET ref pad.
> > > >
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > >
> > > Who will pick this patch? Abel or rob?
> > >
> > > Frank
> > 
> > Missed this one. Sorry.
> 
> Just see that there is V3
> https://lore.kernel.org/imx/20260121-ccm_dts-v3-1-820ce9b5fa38@nxp.com/

b4 will pick the last version automatically.

Thanks.

