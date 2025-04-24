Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C316C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+CZ5yvanwkNwsrX8wbr0v7bU5gRB/4DWTNm7EwR2xs=; b=KA1XONM5iIGeJa5C2PcX7GLHLU
	ds2HBktff2d3tK5SBXWbEF4ybpJ8t4CFOULPww4VI6M/ABGpqgwJhvih1i7nOB23C02opxEwzO4nD
	C1Dw3le1DVDaTvOeDJhM1sEPD5IE8mWgyFUyVrWrN2t74qY8/0giaDK6zTyqrlFrvlq/fA0ycGx/D
	7VkbR5GlAMB8KVvCG77eMfUt/sFlza1NGyUJMiz3dCL3aGIxxEuGBUYYBkQMc+85FmewR/12RA6x2
	mbG2EapBopm9XqrB6pQmkNWXFPqJkiS038Vyg4bMQd5rHSmoV5TNRMUom6M1gcRKaEN7kGp2MdKE2
	g03jf+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x00-0000000EGjZ-1ree;
	Thu, 24 Apr 2025 13:52:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tfN-0000000DeIo-2Aqt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b+CZ5yvanwkNwsrX8wbr0v7bU5gRB/4DWTNm7EwR2xs=; b=NdSVlJFOSp0uczQFUtIf06q22l
	pZBKlTXhGvnIS+GA07J+45T/JLCuaW3NfJ7TgqcWixqae6yDBD8652cvzRG8MLcSVObwRd3WeP3w0
	4apLXxdm1+mmx4zSaxuRdfDu5QR+rezpQ+6igmgOkvnjnkpEy3X9TefdTL+vMyGOfkko9IiK8d19G
	cvmEZ9Pn/scUqj2BmPdLHWzD8wlvPjSQ9XxUGzGj71/jIg04Ed0PnY8T4io0f28JoICXb3iw0w6m9
	gDFm/BgjtB4bUhajpLv9C7jg7HUDZAFoKibRyNsQ6kK9ViLSoXd03hWQQO1etxtp4I8J3dUem6/aM
	pBzrqEgg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tfJ-0000000Bj8f-3jCo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:18:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Ok003400
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+CZ5yvanwkNwsrX8wbr0v7b
	U5gRB/4DWTNm7EwR2xs=; b=fXWNQZKA5tt55ydMaRlEOxI8rt25vsq1M699s9O/
	WjAuarD1DKKd/nTTiQg+ZWmsp6YdMHuDoY1nIznIYRQAZ1fNRQvsM4QKTF+Sndvg
	qhAAMFrcLtQRbVD261Qae/tRoQk+oJsYcg/ja0VbIvdRjFriWLU4a5ltySvZM5sG
	wq7xdqsPuiHYVA1F2VLk90hltCiiWf/MADWXYbhM3kOW5TeXA2hqB8+M+NPcEjR4
	Ab9MBQWGe3HJFKcCEav7V5ksv9JmNneYYkqCTBKvRxjIjC8ITyI9YGGbfd2uEEpa
	O1mRIo/TcenQcgSu6mjx/yu8Ug8uKDxmv7CuPBU0SWJigw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0n3wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2a31f75so268203885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489922; x=1746094722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+CZ5yvanwkNwsrX8wbr0v7bU5gRB/4DWTNm7EwR2xs=;
        b=kxgkNYfxGMmOw3Qh1KVJGU3QUMf0mxagp107jfKFlXbatHrgPL/4qPumMNIFmYd/kv
         6UL9Aqi95B4njvDKACgExW+iXFd3NO6+yi2QFLTKGo77u/iWQsn3k6cwpFGPT6eakN9w
         hlRVpOndu+pzyxyGzY0JtfXFmNraWMntvDtP0lgf0k6+gGNhGQnRFi7TSkCVGcC9L47N
         xyhHrl82naEwRtXk5/cWr417DG06dW2eTo581nEC6An16zEE5tSgbukvtijO5IZs4yR2
         FFpLO1FiMShdkuwo6XmcVjtKrIANjFOx/gNrZrP72X4ht6HZM5vhEtWq7d2SUBUZN/tR
         DqBw==
X-Forwarded-Encrypted: i=1; AJvYcCXRxH2c/65rr92zMPUktgd3+mgYktr9kINQytIgC4mWyfAoJ35MNWWUbygXQoyfVjwJ044RjwHkyqjknhdPte2Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+C5gqwoIa5tCbodiuV6BtxoRTTwNk2fpvrYCZhtq6G0bpUhAZ
	aqHN1c9fGcWCcGXRHObQPhMtpAJIiw+/1cGRUy4UOxJ/VZ+4wO31FBS36lsNWylOuaE7cy5Bn/Q
	KMhwdJuNMR4eTpWKGhGHYt+uZmEYomHsw1up1h0mJ0O8fkGoHKd5Nw/f9lQL6RkuD8QaFG7vVNg
	==
X-Gm-Gg: ASbGncv2vNVRHU564yDE3lbYtCr6yU7k5zbsWj6gBtvMJy/kghL7XUxCY7TnVETg6tO
	e0m2hwobxBh34Kdns0D5UnI3QOgkMn5kElmiHWGIFF9GMbJ+/GBVwt6x/U30QpOVy9SCfAra9Zm
	TkWbCReZqzjpGwtUIs4dWOybg6c4r7GF0tZR5hTNWOKqhGkNZjEWi7M6/nF0unBtssuDhjIk+Kk
	CDNe6lEvH9UWQ+DSijB4eucBJ0gNPVVnZsmLTea4CMcK3th/XgAa77CNd8Z7cNBJo2WX8JjF3xc
	F8o7ZvzU2MkRu6i8RnGTOlz4WiwKtd6Z+d03VavnOHFBQAmIwB8g+oMYSZ/rYLtwN1eJBDEgJZo
	=
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334007885a.49.1745489922690;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUyasljwk71lheOvieQO8GWyGCHy47iFL98wqeOfteeZQyBP2cQ9ZJ7ujqmqOzXQolEaEspg==
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334004385a.49.1745489922351;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26242sm181296e87.21.2025.04.24.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:18:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:18:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
Message-ID: <2gqcoofsvftuvvo7fl7ktkevrhjcsmei423qjdownslucqezib@xpcrhcwnwn3m>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
X-Proofpoint-ORIG-GUID: wpbsnJI7LFPhCOHw22HGmHzRn0IFq3Yy
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a1003 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mLCiClLL8ZwIBs7X0_kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wpbsnJI7LFPhCOHw22HGmHzRn0IFq3Yy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfXzMdjSO8JmGBp svlkN2QIbccfKcB1ADezgcim8jrBvCl9N1pQL3HaUX6msQ3Mey8aKit+YsTlQ+s7KkwI/ob3MTW c8eEFFOPbHUnQTuxP4gJDsc7j4s6ilmjaZwwFU5pgnWNvjeJnzJ6tzVQbCpT1z9YS8BJ8UYgo4F
 J2HB61Y6FJdzzE466yJkyGJmx+eY4wa0Kj4wqM+9jHYoxPGe6g0m3NLqN92hbVL1bqAl9za9L7k iHLGkyJlUqoggG8u3+2SUKODRo+msreJUMNikSqCPzW8RmseAKg5eT1fbtgHnMb2ntDHPNXqqHq KORSwuM1GSnVUQXzV1SmiGDhdfRZyDKGhuA+E+VxWIfkV93HbdqGYUAbfpp+dl6RSSg8NRBngnJ
 ktJqbnokRIcvf53p75UZAveJbmR9BoGlxYT1N19BJr4m9C2vwZv9o6mQkgn5cfJmWb0y+wxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=670 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_111846_249977_1DCF6563 
X-CRM114-Status: GOOD (  13.99  )
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

On Thu, Apr 24, 2025 at 03:03:05PM +0530, Taniya Das wrote:
> Enable the QCS615 display, video, camera and graphics clock controller
> for their respective functionalities on the Qualcomm QCS615 ride
> platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

