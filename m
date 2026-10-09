Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5FCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=; b=fYjoB0xO4LqCBRHhO7YN4KQmEY
	L0N0HJW0Oofcci0VVxL71Q56tuFDmvVCtaklMK5psLgnMTuyhCFH5ndqd2P7+vKx2+so9djwT4gWh
	2n9o1iKb9L/cb+zq9EQEoNhKAzpOvNucnHlQmMh9gtabqKho1xfzk0KE24lYPaOVJO10bRaTSit0Q
	jCPLrYjefAoEtAUD7NHlh5STJQVyIFdSqUGj73Zp9lkL4DvcyMmIjcAQowsDBfy0irtexOWbbzXSi
	u+hzV8+TBOEgwuqNXfRYufIVOvKnk9Pzs/VIKI0zm5lfojoxPLWH0ifyzXbLTC3NXVt3O2e0taXZw
	yWP7Kq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5m0-00000005nMq-2U8P;
	Fri, 09 Oct 2026 08:16:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5lx-00000005nLo-2unB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:16:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HD53593970
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 08:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=; b=Fp/K5liQZd0BPbPo
	6C8FYm6+sKesgHm5jfJqOTCdAVQ8fmBZiCmOHKbt03g5iWpY6jVRjMGpdqczBh+x
	EGi2/VnvoVuAjx/e+EdGKmMrhrUXLhCWh1fBCfGwqEplnnDBMZOD/vqL0ygyM7t4
	/C3vlTRsN7F80iAT8QoXSGCAgRST5zWa/l9xaNGwMReTiEXTnUOeLwUAcmID9nBF
	paC6xLZuPglh9Q+A9Vj+u8j7Xs2S7f3uNrV6bl5SUl6d82UJC/Dw11vBM3ojVPfz
	izx6rMQo5dVHZSBLnz6tpMNHDavOr+cbzcgpDuaGXMja/Fn4EMSZ9A1jpnCeRhJr
	4XIAog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj3tx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 08:16:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso460359885a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533768; x=1792138568; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=F+AB2/FOlc38dRQ/iCEk179MjMJx5105QwGB0vSd6WnLt0UIyzCFmkO1NauMSPGgmu
         II/pUO5V6PDZPqtSdCE40XxXPjTxuWer2DNE/E2XIs7tuQ9GD/wEV4/9XYiKRs4teOer
         B9r1rk1hAfrt0kb+YAN6tgVXeAJDUSctwxk4HVjiAsshe1ujsDACSWHlyiFesLZrwzz8
         K+KdqyQ5SaMcDkfHY0zXeDxRpcxtTpO0KxVvAJUq+dhZ0JEOwMNe+19m7nLPY6JJ34SS
         BBl2DGvgVR01cy9uzLlQ7r0jnqO2O/VctFwTZGhsLnkMu3dEl+I6HjcarHAAEaRBDPFP
         a+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533768; x=1792138568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=R1tYu5gP/C3mF2Lm9OdLehK2KqAxIR0q2+UyaaOFSfxTC2iKI5bXyS0fRKvJE6Aw76
         4jgivm9WxuRop1oez6M+BIJ7C3mfVewZoHVK68I/48N8wqo4cplhmNYZ4m1uIu8nV7c7
         y3Dhc2n5PUnmPZ4QJB4W4HbGr1q/rkfe8A5BHP7D+o75asFRHK2YuNwbZiIQmzE0ypT8
         StfcmNYHixItoNzJpH5G+wkoViVvrIzJUf2iLWuXIioNjJ6M3/Ak2PpxbpJ0RAAvPaX0
         Yv2pqOTTQGFEeyRmuHrUL5KwkxChdryJrJ3DmPBSC13Onn0X/2ZY60WuTfz952EF3HMn
         TbRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmf52aUdF091jNXvv4ngfLzfk8yZs14WZUjMWDzTBU6qIZxs4xJFIRpSSJQ1nL84Fu8F8NXPAgXejygagIhDza@lists.infradead.org
X-Gm-Message-State: AFuF++n4D5/jrydvf7daOMLb1f3LStganxp5YSEcbU+GCNjrq6f65Up+
	dpqsHJLjhugdqGPpNAy39KQuWgrGThsXZ2OyFMbyRC+4+S77sXDXUDT8lXg4uUyOG3eD+qOepkl
	9q1uX5v7r9Xx47D5XvvuoF80jVJs24YmMO0nKCUJwmIATAtEfw9ENSFb1UGIiBtzGETIr+ju8lK
	7LRw==
X-Gm-Gg: AYBFou1E+itRsHrjO+iCbGnqHns32G5BMG58FzETtvT+7xdhMkOjoRYk1CSTQbKPhN9
	ekG2TfgbAhBsCBfYIYdzZ4P5AlhS9vysp+Uq4TPxGD/w2K+wdqixXipvGwTfnxM8hhcDwgnZDAg
	M6v7c/LNaGAjIqTtivDUFo9ZdolxcNhY9pZMhg50kJaVNHWfWF+AmwLfqJ+SnE6y49LTE3tgU/R
	aTLDOY/j8o7OcZUriVt9xP96jB3Bv7AV8WR8CDfC/BuVKOU992Asz9xSvUtSJPXDajKmLmXczpj
	autJYQ33ATv0YRhP/uzWegjV9JA8yhVz1NiEvbEpCIZWZdzP8SUfouEgAZcdVljZNkxZ3wT0MdW
	9kTelczk/76XGhJZGrkxdNxU5P6Y=
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213376385a.27.1791533767744;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213371585a.27.1791533767082;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm69068565e9.8.2026.10.09.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:16:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Date: Fri,  9 Oct 2026 11:15:59 +0300
Message-ID: <179153373231.1996373.14178239298073465630.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX6yhyJ9fo+qpA
 9LGiVc8HmPuMufThT9HxUNbYKExRB0yfZqWBea5M3ObGzHywboV+2tUQ2G5nF5GlZGX4Aku2zEx
 ocVhvsPo+UTfwD3owFE6vx6/VhQnmNRmRMYkFO1v5Dbs2veIsw/WmLCN2Ko6cMCDgsDYlEp6sYI
 MseQs7VYUOCwsPXJR0VjkF8xP+31gGIE/kdl0b7vCi2X0Nn7SVzn8u9q+oAllnWB1gs1jM1Gb9N
 yFJAK1WW2NMXA7Y5gwtgxLilhRmX6U8U6QK8rL1N6rEoa5Ah9RKBp0s0uzjx/kYGVJmpj5Drwu9
 RBzqV3WpLEBHPRn02o7OqJvvJvY2B5QLRu5/8MLcH9QLAKS2UfpiJls9vuxGosXUphUCT06wJXv
 LeuC3xu/QZdYBH98Knq3BTntYxEXz+xt2KoTBC71IDs0U/5hfBkWIYTYVgxuy3OOK3+sBgCNjNp
 wiEe1JSFEDFY/1yihGQ==
X-Proofpoint-GUID: YuRU5Ay_f9TtQq7JzvytO8CnbZSy0Cbb
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8a2c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SBSG_3fblaHcu9w4dFsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YuRU5Ay_f9TtQq7JzvytO8CnbZSy0Cbb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX2DErBgwDm1cL
 5DwRBjB4WhOQAjPPVGE1HWofomJJVCbUBb5EtKTGwvkueS0FUaEp4FXPn32nf0oEqEkzGm6DQF8
 v6FyJvOVU1me+zlkyB/hTGoRV6wdx08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_011610_195306_737D2A21 
X-CRM114-Status: GOOD (  11.62  )
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


On Thu, 10 Sep 2026 17:19:06 +0200, Frieder Schrempf wrote:
> Add the 350 MHz frequency support that can be used for display with
> pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
> i.MX93. It is also usable for parallel output.

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 350 MHz support
      commit: f85b551c519ee8f92be601ccf4f7d440582ac476

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

