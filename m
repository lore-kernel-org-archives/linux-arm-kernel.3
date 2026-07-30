Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED1CC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=; b=uM5yjkrvCejAqWv31YEC/zFNH1
	C3P59xm0J80yTQpYvf99WE/TV6FRp4NojM2nhLgw4uWGw8qFKf9Ov4czGtMvljgQej3gp8d8kfOiM
	7zOeKaLtbRsipY7z7UxTAc5N9EGJ3MDbqj6BaNXQZpN/ailsWcUcWGeR3zQYMg3o2ESrUY8MBJZNE
	UJQMi6TZ/f5oVOamvnVYWzQrUs2D+Jx9YmLELUDZh3rc8U0IOf1vTTxTtLi+KtGV/25U+q2cWE8k+
	Ip3yO51fM42hfS6yuKNkzNNwxdLQfsxvvtg94E6wQluW1I4iW5D6N65yAmJdHAalfwyNx7eH+qGZo
	fY2tGX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSQS-0000000Ap4D-1ZBO;
	Thu, 30 Jul 2026 15:12:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSQK-0000000Aozu-3EsA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 15:11:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEdIaY1110011
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 15:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=; b=AtGHCuSiYuVCSyDB
	NXsCgob1HGbcw+bTaX/ykigECm46dZJ4mqp1Mxw+2+2/qCVlHBWB0oQ/t8b/WV0k
	Y3oz4rphSriOLDUrhNf3HVx7+5GWQYVFvw/sQwNkbDcV5mrwl8b44lb2qZSY0oMb
	3jXpFGrhaeSmovs1iFKELE5mg2/0KILXGyTpSfxt3AI4gJD8SYMmNsIszYN4fYL6
	cvLRHfciHpiImZJU0F5gcQrko/Mc4CCH4sG4UD8UfKimHEZqvlgw7aZtoeD3Xzqz
	Irhyylth0rOs4qjViEghhNktRMQCpBxecwyTaF6lg83+QexFbT51WnuAUhvtm3pq
	KOyj7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmr61x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 15:11:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so25334751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424311; x=1786029111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=;
        b=VHwehAYCUjpxzVzibQPPJGfDGAMSmXBHEKDH6Km8tudKUycge1aZuaxJlUqwOnzlIN
         jfw9ErtQQpcxy9MuxtX7WeZD+NDOU/LNBVTv8Ex8DRzSiZb9p32APX74QIXCwAi0RT0v
         HyyuhuTv63sBNNKymDxL3qRtazKfN1qTbEI469E1vpe4T/+l1ywzZkQCRY4yE67e6hZs
         w39oc8kdHJQxBfPruBbTKeBySMEwd5L3jsVB/kiXPb4GLUX5OUjWWne0fUgl16ZeOguI
         Q5B1oGSFRYX1OIBtk1N8YG2qchpeRT+HL+AZsRJod5f1OCt5nzd3si7KSznP6kkSUXOO
         yPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424311; x=1786029111;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=;
        b=Hy+HgzILGjckmJrx/pKFc5p1IDajkvY4cyCVxEWlq+GAfXV40MsNfFgZPOnuzr+u65
         8bMJW8iqnopbtUdgpTB8XREWUR5Xh79AruN5FYmNdOmjqI12xFmTgTVx7viQOK0DLt41
         RXLvHZ0XBwLdXW7NmJmOSbw2XGVFesqC7czByFEdpVtmMZHDRXRZDOUUFBMFyJPQybWG
         dCD8f4oZEXlRVJJAzBfq3+HlhDHCHgTPbFylJ5ua9p7Xvpy4Lo7vjfIAF7x9O4RSgLPh
         hPfjM3XwWtCxT0o5SVM9NnAoiYTKA98u/bFCoqeEVT/YUlmlf03rc42WUt6WXB4AtdRL
         wFig==
X-Forwarded-Encrypted: i=1; AHgh+RpSufzbmX/ugty2NeP7VK4z7Mvr2OC/iPUUrwGmx6K7eiugy1wUiBiPWDpejTuuI7lDOIwIq0M96niv5TDNAUgu@lists.infradead.org
X-Gm-Message-State: AOJu0YzvPvBMNvIuSjONdn68CoLa0aNi/nYXAPlBzfN7zKbjHH7ts4xS
	3sgf6E6yNmNtwuSeYVdr4FPhIq5Y71nc3pDno/SHBx5wFevQ8lmAA9RJjzeArhWRMo4I4SvrD+5
	y9UVHFMC3+vzbByiMBVGnK7vIU/BVUKUeJDsVWiXvOaT/d1+pRf6CnFOEFJUDDQW1Do8Bbho3dy
	cO5A==
X-Gm-Gg: AR+sD10qqlR1ofTy2kUgCrdZf+6W4lvW84Dt+MsO10ql3L9LlsZKNnr4nOe4sjoM/RY
	HltNaXzps4pG36me7SFUAbrWArTIBY/SOZjfhyk+aVjYJrK2bqhxlakk9WbeAEQlg0sDjV1WEFR
	sBFO2oRiIruHtiUzjFVojByqAB9SkQN9jcBkd57DPTTKH7W7vHCF9EuEcO/BB1yz5GNsAzaYljD
	pPdLEFSz9p0oq11gYRs0V5FqDBJ/za9HwlCSrfcvOfFmBqlHF09b2AGd4K7zAMWn9LCGQRUBqji
	xAFdi2EoI680RPAdYAOyG4HUoK8DsLW9ePiZ/ftoRMCSx92c9W2DhgETBxiz/2W/76dneV/fkuq
	jJhiWEjisEy9eHOiHEchgg4rtldM=
X-Received: by 2002:a05:622a:4b14:b0:528:3ae6:14d7 with SMTP id d75a77b69052e-52b38768f8bmr27763171cf.59.1785424310908;
        Thu, 30 Jul 2026 08:11:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4b14:b0:528:3ae6:14d7 with SMTP id d75a77b69052e-52b38768f8bmr27762461cf.59.1785424310154;
        Thu, 30 Jul 2026 08:11:50 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm64581405e9.4.2026.07.30.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:11:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
Date: Thu, 30 Jul 2026 18:11:34 +0300
Message-ID: <178542193568.317194.17709997600643119798.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
References: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b69b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=J2BI-d2c5pDyFB2YWN0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: U3aYRJ7WAxZtgkXHcHvAbiB7Gfp7SmcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX/QLxQsOF88EQ
 Dq5HICDz8UnBqk8hWyoyjPKyc2Yn2PFNNaKY22irljvWxNJQxqOl3H9NlkKCGOcri3/Lr9yqR/D
 /sTo+JGm94K84gQJu2qeCH1BMzcA+12oy0XQ0gljVjNw/dum/A+tD1H2d8o5vB+o4H4D8FqxjEP
 Hr7q9XeRTG+62fEfmJDyCXOOeelRrUcoxiqSDQLFYxPZYGnCvQ4DM+Qvj3aiq70HlsMsNq0YrdA
 s9zkB192gTCEWIiaNoHtRNT4R1AgK1n8u0bd+W7+XJwN3ONP8/tesqGGzS9TH1NJtdYXqua+iag
 t4Wdb+oI5Cuunmv3/iEsUL7XycvHD0Wbj18nEVcO+5LcWnyZHXOs2VrNGxAxClHuaw0mm46zsx7
 XrSZKK67kF9RnHAjVudWvmWlADfZ0l3Cmqt3cT0OWogRV3ix+82kPgsQXlbCgtR26HkowdMG8sR
 8KsMteditAQaaOstGKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX4iUI+mr1JQUz
 GoPfLHIaNIbDcBXAYYPU9UhWds2qrJe52SEXaDa1Mcb+qMKMVVV34MapMn9kEdDIsne5lLlgtcJ
 S9Tc0tHE3CAb3rghGrFGTBcqgZ14HYo=
X-Proofpoint-ORIG-GUID: U3aYRJ7WAxZtgkXHcHvAbiB7Gfp7SmcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_081152_949394_A6041458 
X-CRM114-Status: GOOD (  11.99  )
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


On Thu, 30 Jul 2026 16:55:42 +0800, hongxing.zhu@oss.nxp.com wrote:
> Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate clock
> of the CREF_EN (BIT6) gate clock. Both of these two gate clocks enable
> the output of the internal 100MHz differential reference clock.
> 
> When the internal PLL clock is used as the PCIe reference clock, both
> BIT6 (CREF_EN) and BIT2 (FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.
> 
> [...]

Applied, thanks!

[1/1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
      commit: 884dfb2dfe2cde33b8efe91ebf91542c88ca9034

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

