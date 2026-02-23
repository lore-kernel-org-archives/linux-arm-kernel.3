Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC4FE98E11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=; b=VO/BNd1i9NvpEYBC3xY+euKNSS
	VKc3uX6JK56l1XV0+VHXYiw+GCG+zbSVRNSGpvTRArwXF78csPQQ11BhdmjXy+toJcmWFFZsoDGPt
	Rf1QsNdR9ajVy6uJUHL2F3oTR/xEmY9bhzka7ZwIRYZxlGm5s7JH6uI9Y+vYWrrf9XutnyfRcmkqC
	ilgYNC9KElfTFPoyWGli5y6UamptlHRX6OZNua5+P+nsA6pp2gbobjq1bQIBMCledOuY9DltT39J7
	nmvVihHY88LX4DkWJhBLgJjSDddlKbnu6K387Gc517aM+BWoqJxYgVOk8619l74GsLl9Bh9WyiVdE
	ZHqmXS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSc0-0000000HaHy-3JcH;
	Mon, 23 Feb 2026 09:52:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSby-0000000HaGr-29Hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:52:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHlLE2045688
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uoHMTBb8IpVzr1yOCWWsa13m
	cN23kWHrFMIDsOYWxZQ=; b=PmD/ngZdTMeiHW3/nGgDiCP5TsITHRVqW170k49n
	qWSXXuUYbS8lzGkkHqw9bgWAqISRDGuhZhQoyRZv1qTDjQUUbYzzqt59myo/93GF
	onCixjAKIX8+8sySzi5VattQbfqINFnRRgLHUNx7clQMLpdaK/nQaQ7P9gY3U52y
	grodMrdOfHlwAVjWtcYHxbciZlYTMjr5Tl3NkKC6V1gr4Br6JIw6nFrUPcTdBHuk
	34McvIGWFAyqHrShfNLOXeCuEeUSi2HiZvPJsuW1tRuNXkuS3P/f1BFW92t5EIAJ
	PE4x30UCIh3SEUWArj5TSV5HlG7TtyeyJjOhX6xC/NDI8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav8m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:52:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e78c4aa50so2754065a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840337; x=1772445137; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=;
        b=B1G3I8iUb51IVgp8x18eJwJLYy7RjWRh4alyLXfYgTgASP/gA8Fcu+nbB6LzDaeOft
         ohQxTqCl8xCbDsZRxLgKzwJdFCt4sAcGhUj+NM6JK7Kk3Rgpzf/bUNi6Ki2FN5zVSjPW
         XKKvKGND0EqJ0d6MZaM3vcGLkJje8UU+rJjubBZxpVaEsVYr0b+KNXmDNIsqB9hkxbPY
         fChFkrPIGuV922A9yQYP+EtXxlAEZzV2pCXR6MxQx0DJS1a+a67+xy3c5SkoywqPdmeS
         2oyJqx9WDNj3xKgR4oPrdqJ4RGyOegMAiujXFBP1ElLl8FHH7Qs6lt1qACYcd6YBTfTL
         s0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840337; x=1772445137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=;
        b=i2RY3s9OHsrnSF486wOQWVr0G1PqAfzs21jODPAJc5XYg8hra23TWxFeITzDCqPAic
         updtIieqrJj0dLPcZ08rKT8JYmXqJOM6Ho4GJFkeYKxkABg7Saa24aifsi6eQsSqNJCx
         d+Rmkw0dhXU+3fIzjD3wSsw9lgW+ha/ETxD2CPM/9Y3MDoW3OHso/cmRcb8HhOlnJHAw
         caZ8uYmvcmLtLsAgADcy22GSB0jjaT42Wgqu1HFuPS+NE3I4Uc+Edscu6lE0gSFh5RCJ
         /WvqnLz94e9Blf85+ude/6VlWuc5pR4zov56QQAVifnR6FS+0kaudhl3kgr3vE4FKvk+
         9bLA==
X-Forwarded-Encrypted: i=1; AJvYcCUdeBitNMQ0Q7pPy1b7a707kKO/Py81TYT7SFP38LnqUz+WDntNF/RtYxEoy6MLDjLYwQvK87DtYpUmk+pfYDn3@lists.infradead.org
X-Gm-Message-State: AOJu0YxAV4QKEd2sxWI6c0k53iyQCnArlA0Q9AnsGFQ89L2qs8F1AIhQ
	ji58HyVGLrrZBxwYluA6A3OYvI9PgyIWBl7MNVGkZsmJz1l8TIlTKO/7Hhc/9NOlbrtAFf4+q4q
	OAru4RqOVzlEVA/uUtQTuaZ90UjltFg7pJurWk+yRRKQ6dA2/n+PwCOE89QkAcBcXBcZ+n2p/qh
	+svw==
X-Gm-Gg: AZuq6aKwlJIEVq50BDJ3TRuvgQOsueJpJIJ1oPJWyeskiydBj1gpgKuh8eWC1NixIAL
	AWRJXOlNnQR84HTsWlTcUSjG72JbgfYtsPjuuKtrU2O2rE+4eW9q1MCHjdFnVWHcMyB7vQemdJy
	ZL+BiSLj/HQJgGMfV714hDGdtQNos1EImPkv17P0S/66mw2R/h/7Iy38bnszSSMhZR560CzGZkP
	ILSBhCIb9360RJvlnlol9tjKd9flwUSPNbTcEw9htJqQephFzhHD56FX5gtgYWiUfkcEVFvZOdn
	+DPKFg0ufe9izR1VZ2ADCyB6MH7oQD4F8wr0FsTwP63t1ubIwcQtvtEL/NgW9Iz+7Qa23Ox1Fcz
	TsaRmc52pmfiLKGSwOp93mtagN8Fmd3rJPwQ=
X-Received: by 2002:a05:6a21:2d42:b0:38d:b865:3a2e with SMTP id adf61e73a8af0-39545ec839bmr6508767637.25.1771840337206;
        Mon, 23 Feb 2026 01:52:17 -0800 (PST)
X-Received: by 2002:a05:6a21:2d42:b0:38d:b865:3a2e with SMTP id adf61e73a8af0-39545ec839bmr6508755637.25.1771840336687;
        Mon, 23 Feb 2026 01:52:16 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a735csm6444453a12.12.2026.02.23.01.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:52:16 -0800 (PST)
Date: Mon, 23 Feb 2026 15:22:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next+ 2/9] net: stmmac: qcom-ethqos: move
 ethqos_set_serdes_speed()
Message-ID: <aZwjSe5zF1+fKoGa@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c2352 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=4YUTyhlxiuLjCXpWR_UA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX/07kXY3Osph1
 GLbowMlmrKSWM/dFlkmyuZZijj+ICxnlpS1U3Ushliq//Pt/SCTY2StcQ4Wr7gEQxITI3iX1Meg
 x/oHJwTznZkHGuodWxWciccXfSUZiU8wH8Vpzdf6kqzAa/u/0JEIluVq490+swD31QE/ReIBv0J
 1MraxvOChwpIDat7nF/L1knXtV1Nbg1WjHudMFWzBZ3jyjjISHLW2oMIGDo0Rkb9H+6m+o40JVH
 mvfxouGM4ZMnYfSifK3s796IwlVkEjRu3sYcgSQfiPlbBqzvcJFX43q7o+NN/CEDzl9zaK7SZ0r
 QaTjA+U/tiRUW/v59F/eBMQKFFsfo1aCPV72zVylJqeES/O7crfsb/JORyTprC8b+Qzqwvh9D/T
 fjMdBJVJu5sno+RgKJD5k1XNq035ZXKFB1BfHvidmilZKt4IsBVlwd4PkghF9LhNfg5w7ONw113
 hFgWgiMCFrYSVpMV0CA==
X-Proofpoint-ORIG-GUID: rxv4s6SMeQHa5lFvnhEmmHztPnuk5OHf
X-Proofpoint-GUID: rxv4s6SMeQHa5lFvnhEmmHztPnuk5OHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_015218_556228_23C10E05 
X-CRM114-Status: GOOD (  14.15  )
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

On Thu, Feb 19, 2026 at 12:50:34PM +0000, Russell King (Oracle) wrote:
> Combine ethqos_set_serdes_speed() with ethqos_mac_finish_serdes() to
> simplify the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

