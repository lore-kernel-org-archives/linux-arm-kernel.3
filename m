Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FB2CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=; b=yCGMkl+QpCnvXLbTe24Lk8Uzki
	bKDKzpvYjKzIWpstKL6Y/YzqmFHolPb4NPkSIN624bYmHKmxlFW8loETRde46Mb4HiSIPHcqFpeJQ
	GUOkX7KT8U6zzUwwIdxuGRxM1PgHLoFDJebCHI5McZ6W1OCHVlc8jP9RJmuk7NDNgoujBmhYn7G3H
	JZOfbQYL66CUpuFD2PYljnImE7WkKfkYjQCsjcEM4NTkJ5S71OqWB8BqetagoxmsqpJI0S5Sit8L3
	vGxlFslxXKGWy4mJWSn0gnUzt5XzDPcd4Z2sDKLM11Iun4Q+3GgGfQcRtX8ElSwBbQpqMqdgPAto6
	q2T20Jqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhxY-0000000Dtm1-2lza;
	Tue, 13 Oct 2026 19:14:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhxW-0000000Dtkz-2dbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 19:14:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHRCL23017705
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 19:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=; b=lKgVetjplREUnJh4
	7iALWVWIP6om03f8b6FUaHo73isbCxsNAkBSJwvW4sZDHEI3ZVZKTkLXjJvUa5Ed
	MaALsm+uw0nPET3dpFhUGLFsbh6Q3ebjqXZlZN4/lHqUm1GNzlgCbzWHIOZmkyfk
	e+5yn4AwqO4shxcu0IO9DApGlEkiS5ZI0j6BmjOjyE5avrlvVgyUS9AxcZcC4QFv
	x4S/0WHNsxosz8qVZJ249qtjTUu1Ij2GPmivaPEFlGaD4PNDS498pVt8bkNmG2GF
	BD9K7ukVy/Fi5Asc6Fpt0FsZW83kvqpkc1NZwH5ExbaEDDa7xS4l22AleqfiR+ox
	6szy9g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b0j3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 19:14:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so230667eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791918875; x=1792523675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=;
        b=PryxkoqL+w58BFHCATt1u3f1ODJyXyAUT8XA3WcYdlwcWtmGoZrcjGcqpFftCD+nqV
         u5ayBpw0J/BJJhAjCXEf1lbacxYmpAcfmW7tqx7hT9rFBPR9zXu3QWxxDC1yoSefh5H+
         nAVxS+Gb4Ak3ONkgDo7YU8fByELjgIQqpLzEtnX8BTG1+aswmDOeIEsVwTMU/wR+Ha6h
         LiBTzqiper2bPvVk/fvLnaaYSwLb12gQtBry++aKIDLeNcNbASauhtPR7AB3rfqDM+Zc
         l/NL9B4oYrIXCvSmPG9u3Gi1X61Ae0Jyyjjsd+DJDYgbQOrqZiKv3sPZ8odlt2LgCh5V
         P8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918875; x=1792523675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=;
        b=xtdZemtatr75Pkf4PiZcLPxhEcfCMukFdV6ixG1z69mw6kHUqgWZWHJiR9efsSwu68
         gZUyQccti7ZfHiD6mVQyshPqqQ3U0YwVSsFap3AKzDQ42QxirGdCnbWdbvb/XvH51ESj
         DeVNTVJKrSL2XnzPw4djHlOcuLx2nc5bhIlmX/Th2BxLClZxgSCOIkUeK215GIqnrDAU
         Ypc911mUaNfsb80o+in2cPRNA5kap7m/0G+tZ0hWyRpPo0eLMJWI/qOvxIJ0MuTh2u+u
         n47+hxzzjLwoAPsZtGUbsPxgrlVDrt6NoX1TYaP5G9HdEnp2pEXGVin0c4YQEEiwaZpR
         etOw==
X-Forwarded-Encrypted: i=1; AKwUvBzszVIn6EgIGtaDvVCG/PdRIkusOX6X4N6xyFFsnjGrGTk/iYWka0gsVKhVvm18oIGuARvDlIL0HYHv59f4tHO8@lists.infradead.org
X-Gm-Message-State: AFq9FYLlr7pqkm713VamDr3EY3vCep8ekJnJDgX1wvOofaJ+m0mnw0Or
	HohPVgVu+XbhgoZZWIwEJJ7GEbMTHj7MfVlf/hKaRLRW8p0IzenEjTvobKBPrfkxLUfB71posVo
	r9Iv5oB0sZ7wAeY5qCLb3P0zx9TGcjwZ9lJNnald8qyQMLwLVzsyDuIphekQRA8VSmrimUn/ZZg
	gWQg==
X-Gm-Gg: AYBFou27/XV9PaHxXmufP+KlG/WcwXe+2p1nElrbt3+T8YuHTLiUhyzekArO4eS9126
	yMd91UKD4XmoChFGGz3ExmsQoUxo+VZjupOIWmjVRGbgUMGjfoifxnWXd7aGWGMwjWOmiUyu4ER
	Y+e0vNihjmWGTgsPaZPcvVzWVeuwUnAeK1plLFc8prht1BgdhJ3uH7iNa+YVbH9OJBKBoecRhPt
	jT4v9LS+ZUdP7MJGZVWME7GkuxIt3S8oQw8BFegzYVbq2lviix5iEWeM0ihBRBv+sN9KmQYCVJp
	0Wy+UN9UJOveu8GgzZuqDyGQlXB1nhetugmVIDdqKbNxZ5Gz/Lao1Y0qYQMF3fwn2i2k+fh4Fvm
	j3oIm1xHnMVF3xQIbEECPny7RzcgJNnwZ47kADzI8STl7MTkI4DiHjAq2FWoGJtA=
X-Received: by 2002:a05:7300:a8e:b0:35b:f6e:417c with SMTP id 5a478bee46e88-35b0f6e434amr7495228eec.15.1791918874547;
        Tue, 13 Oct 2026 12:14:34 -0700 (PDT)
X-Received: by 2002:a05:7300:a8e:b0:35b:f6e:417c with SMTP id 5a478bee46e88-35b0f6e434amr7495197eec.15.1791918873849;
        Tue, 13 Oct 2026 12:14:33 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm16076819eec.1.2026.10.13.12.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:14:33 -0700 (PDT)
Message-ID: <a05632fe-7511-45d2-afa1-a2215db570c0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:14:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: enable L2 split header
 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
 <bea80b7e-3d44-4662-b3b2-e97a7f903aa9@bootlin.com>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <bea80b7e-3d44-4662-b3b2-e97a7f903aa9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6ace831b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4tsTETeE3Fl7JHlmqNcA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KvIG-vUgVUaQT9EBrG8ZDVXhYznwvAqy
X-Proofpoint-ORIG-GUID: KvIG-vUgVUaQT9EBrG8ZDVXhYznwvAqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX1fDxL9mmJKYt
 k1MyVSt8S6QwyYAgzjjHx+Znz0teegZxlYsez2xVyee/uSSezjwarZ97ehUnpmUjkJ43hJRZ7za
 ry6rAyINcEXt+Bm/+XEOMYz3YDM7Ij70SXTvWqLRNdx9qeBJc42LxcoLfCDDBSELIs7SSMR1lnU
 52hGKyrFyG3rOoxXf4z8iDTb6j9MNWGL8z0RGbBq78vNY9QYitqWf3N/K2lcFan0nX3DaHAvkNc
 9Pkc2DE53mo61W/WFFWfQvw0I53r85n/EX7pAwMEMxLSwujaLrUgiQ7ow5sWbJ6bo0rx9Z/dliD
 Gg5KYT6zsK++sZYZ2rsSEbvuT10WmRU6lxPz3t2wIlU0Xc3+VbQXvw2mtPJVxAQW5GO7WnFfwCH
 3k1h+6ptYPypoUmMDiTQaTz29+o6q02hjLQhLTngVCk4AZRopG+UYDRq5O0sNeFQocNRguQz7WL
 EGpbzoHMHK40dxAQ3NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX2pJz3yUIT8Fh
 K4CtI8hAU42cKO2u3zhR0gkI1qUr/Tpcj3y3MyvNno+bkj48o4zVZ1t8dchLrxjL/xRz41Tgecy
 Q4neTGe8NIiipjgg+zwkwnP4ltxElbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_121446_698509_A74943DF 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Hi Maxime,

Thanks for the review.

>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> index f8ab347f7b5b..fb29dd489714 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> @@ -167,6 +167,12 @@
>>  #define XGMAC_HW_FEATURE4		0x0000012c
>>  #define XGMAC_HWFEAT_EASP		BIT(4)
>>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
>> +#define XGMAC_EXT_CFG0			0x140
> Let's keep it coherent and use 0x00000140

Ack, will fix in v3.

Thanks,
Sagar


