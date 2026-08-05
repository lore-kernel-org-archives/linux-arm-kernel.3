Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3CDC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=; b=1DRAWOepDhIjIBOVTQpFYKvw58
	P6CkVv413auQ08FR1ci8SqGNxR7yZMIwxsZ7RVYgD0sQWfSZZhjgzXBCpJYsvKsjZba+ALcoqb15f
	zMmEtCOw/HlKBAg7Gqpj1dtYixC2z21T/hL1pITo0CXKscRGB2oEzxdnnJs1dB0ieMKIU89yuj96Q
	p4S7LxQhWN9r0nE06b3ozQ9LokzGmyF0pqyPd/NZ1/v1K4fHJuRwBTLTcwAWYn5iwj3qREGewxRAc
	xQvv5SSI0QSudHFIy5dbKvZCm9kS6BRDIxaGodG2bn62gMcpp19+lRsNsU47EcVCajDpnM05eNi4z
	n+bI09GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbso-000000040d2-2rpa;
	Wed, 05 Aug 2026 13:42:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbsl-000000040cH-3FWA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:42:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675CfoaK3472155
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGZ6cVzjYD1blhwp59ff9yPA
	j+yBCEUxvcvUKqMHV24=; b=SeMhmsPlBef8oJZc4zxXQn3r7QrYTU/pwj1MqsQj
	MCpO2jYD2rSd9WYrN6TGYtXghDRU42bINTwbo1b13k2QBEOGc8Cdig7QN2ATOkUr
	IYdDwZs2NvahzywT03bqqFlqjFNiqD9GF6Rj1E/8NgLhJ5D38lj8ySkLURrtAnd2
	iKorZJ+2KQZsUhMPPjh6GohtqY+4wOrS3uBViiSBUUcGgNwcNeknnq3zZb4vOscO
	tLqRKrua88cCmmLd6lJSV2ClKTWncap4sEm8Q5jEGUxVtghvjBSh2qRBTXwRQChN
	WJZLK0c+ZMOkfU4LsiTjWfoF9+udp8DdjmgZEOy4SV5vvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk090r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:42:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso9882361cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937326; x=1786542126; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=;
        b=NORW0h9SPMPDQ9YwIxHAJHbjlQn3Bwagx/z4vd3JahRi1VNsgM7kyyOh0hbouFK8sA
         Ta0XAOO9MEgZ2Y1Pl/U9WxVl0HBVI9TGBIALhkEMoLE2VA7/Z55WoGMvfD83UQtc8q8K
         y1h4qBsAUrEo+4WzwzKsH23E+M5/I/mSecPIDUB+VWIbthNwg1GRmarKPlkBlCmkV+8N
         EXmZuPANTppN4qKJXEj5mILxAfksF+cxpbVK3brmKErolc6zZebdzsITsRL+J1F7lWqP
         QuFFiUTOt3iTHQEtxHJ9OoufoeG4fKlsX4UwhSZcO0pvyRJZ1knXZCwW0ZbqCA3FYHH+
         f5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937326; x=1786542126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=;
        b=mXB8XZmXbjq2mI2wrZ1pUkZ+6EnFg0wJC0hYYyGpuYjxHftc/2aRs72xd9CNVgtV7E
         rxnjKNVmaWp84pZ0ma4TYNpJefs8Ad+DhBjdEoJTSL6mD3CwzylIAAMMA9s+6GvffzuK
         2WLJ0E+mF8M4vcLVCa+Bu1nerfUDZzBhRVu1EJpeoz5CE6u9OJTaWIdF89gl63j7JkHo
         MSVpGWamUDb5v3723xKkFYVxkEWyAQJoZzPJxopT8v3AVaqs6ShSYLKO/SqJCpYVTG8p
         +n6JqCM7NoLxFwxQBf7V1WrMXNH8/AthasyiHhBbQuWiSVLcj4OkeNyobVPaM/n6CMzX
         weAw==
X-Forwarded-Encrypted: i=1; AHgh+RoC5kZhSTvNQX6CKdV5SttcGLVU3V9nouBZp5rO4B3zKHiheFkxlJpmYKp1tamIl/VaA9xdjFi7E8NFEMtaepiO@lists.infradead.org
X-Gm-Message-State: AOJu0YyzL5rFdNbBKAZYz02+v0kYoYKwCQ8GqzoH4qDEG7MzAZguUZn1
	1qeO4PwdBl9RWUVAQnD0e8kq/FQOahziMztAP7Dbs7TCFaeTYt2URvVBKu91xyt9z5F03X1gKdU
	1sFP2bG3CJ97USb0t2YY7wlFjCBwqxddB2co+9MAdPm/DxqUeL4N8u1LkvO5tNxvWJ5h3wnLt2v
	zBmA==
X-Gm-Gg: AR+sD12P3TkOj6x0pPUODQIgaakKY4S91uc4X1h6oKZStHtNiWYx6n53Wsx/ww2GvgU
	vRZGgtr3l9Zsb8sjqiI7ngkOxChiW29M8gi5G8JWtgC2oid6ThTWU1XivcUfnCmIqr8rNJ1cSkS
	fzZgHAQPeFc2CfH1e9frIz229Wv5JrR6DPic55yFezJSVRSDz/P8yC+g1rlbioWmCUG9eR2B+03
	CFjXKaurTgBZVeDueBZlvX2QXH0P+AGqsAey6oJxmQlqK/i/0+YeusccK4SrOmaVhMp1gW9pFxM
	qVq/YT2eTBWpghOdOnV+IpzirPmbqOly9JXPX82O/BF21tZylJwABDEJ/wrzEZYWCE5UwqmGuKq
	54pu3xsb9IR2HZA==
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr67814921cf.16.1785937325405;
        Wed, 05 Aug 2026 06:42:05 -0700 (PDT)
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr67813741cf.16.1785937324345;
        Wed, 05 Aug 2026 06:42:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036422825sm117379166b.43.2026.08.05.06.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:42:03 -0700 (PDT)
Date: Wed, 5 Aug 2026 16:42:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Message-ID: <dftvxtkdz6bnsnu3urcargv3saf3vi7iyaab4uaso4g662ddes@qi3ufx6wweya>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AZyaPJTQEINPnkO75D4dMHjP5LdMhqb0
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a733daf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX/GHPd5c7j2MB
 T++potJ6sc8haNzbJBTS36FVkkUybTPpo4cOdQ0QYcS1eCxzUSRScWlZU9kGCVjSuOUx/DnomtB
 I8P5SouhE7dyBqjXW/VxXHpVLmef+9DcQwP/km6TcppnJusosWD7Jwp6scs7J3/RYmznZ4SyfjI
 uLLdklLSNhUBtBFAOpYuQ+mLYr4/Xp2xG+pkKuMCWyNsABm82atetIQRNrHhu+ZUCQJO2ojLmNB
 VE9zI1UMQKKMTRkLko4xlqbI85zSkFFXuA14xl+tOJkRdvsGba9zcSdRW0uMpQXkZX8eBTQGZ0l
 YUnJ9YfA008V0NZe/Pdj8ijJzb72fqvPMiFM8GRpoQLZJsvglR02/gsUw/hs1Tlv5y8KhcvG35I
 YrEMFR0+W31gm7sfRYLI/vtPRHFz0fsK/Wy8OLXblkVIfGkRkwCM4v2243IklMdAEwX3kwnp15d
 U0yKBKU8LiDC0JDMmAw==
X-Proofpoint-GUID: AZyaPJTQEINPnkO75D4dMHjP5LdMhqb0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX9tpcjHNikMQT
 6ddnLUH09TP4Iuz6cXnWOTkn6Kq8F+kDiKQapaTY45F27Nm7CDNzwdHJvpfEGTKgQiTzHnlKiUc
 txyH7HkiT4mv/hCFZci32Kp8hFrUbE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_064207_820278_EA8DBAA3 
X-CRM114-Status: GOOD (  13.55  )
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

On 26-08-04 23:20:16, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

