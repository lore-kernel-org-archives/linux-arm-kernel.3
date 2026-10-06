Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B9CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8FAVozE5WvzCd4JZdvKH90khQe7swBvImbAOZ1Mrm0=; b=c42XCukplcHUZnH7fR0Lb35Aaq
	bIp1NyWmtYPmWhA62t57sTuUnmopQSSQX3qtKzumGY5McWQow21SEQITVhaaBGkZZfdK92eoUz0vm
	kTLsPq52F8eDUYGkFt2mNjAROz14ARZexgq2JxrPxpoXyTjb+hmPvWAaOfOcJ5YEBUaJBQx0R1LS2
	KnpstntUIDbr0i6yLRzlI6S7fzlbykLV3KYJYEQedYXjE31NvQv0cMjmX+d7wKzxdaZtVz3oTbxwn
	riFM7jX92bFl+te2fl7BzILqbQ03sNrY93XNe/4fvlZN/HkaoC9W2qigJKLST77AK8OJa9tMKpKzp
	LwWmUsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE26g-00000000SYL-0dGb;
	Tue, 06 Oct 2026 10:09:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE26e-00000000SXi-1sYc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:09:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A5nLF361686
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P8FAVozE5WvzCd4JZdvKH90k
	hQe7swBvImbAOZ1Mrm0=; b=Ri99tvINWq6C8UEA/OqKbxWLYBE5xUv6ubefmWhG
	scQEbLDsUabsQjcZ34uMyHbxW+qKlRn8JVpKLVIR/BKuTvD3oI0LB0rXWvTfaysk
	DT5iwkFxUY+l/QHSv/0twNMyrwj6Hq+zEEcs8YkJb2q1NXQAA9e4+YclXFqov4yo
	Y6bfq9TVi37O2Gni+0sRP7kSWmtCN8P+ro7dRxAFT55bzelayeFw35sY3qPhy7ZI
	6WinaNzBczDuAR+WoftzwQLhsc+kF9CEX8GxJrqvlm9/8nJB4/rF5WIXJ1YkbDlQ
	ViZBMRY2XTXCOZSh7wzGmYm7/eD3DVf+qP4WXdUvcSoZqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0b2u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:09:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso43593485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791281347; x=1791886147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8FAVozE5WvzCd4JZdvKH90khQe7swBvImbAOZ1Mrm0=;
        b=IuVW061pESaxHqLZieeSHln5GvvOitVPb/cQ+lSJLDYlWN3B8RAUuxwthutwfEPKiI
         nuhrmnZ/CKO2fntjJ60uO3Jp/HcjRZ6AIe52x+aGELhLYDC6CurZfxA4isAcz9nIDqi6
         CPjoZvrCcV7sIhfNAhJrXFRAsRGCFxcsigwah6qh07LznkdSZ0l/tHfCxijKKQo7IXWe
         3snpfTGbYTY5V71Gq2hIedGTXHF6pRGy3JCo4kN7Td1jYZRNBa8EZkwx00bEReJClvE5
         qpzXr98HCHnTNQlwIuFkAySRdEyUCxzXZTAFQaocbdvub4rLfO9P8CIoDwZJBbMQrF8b
         PNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281347; x=1791886147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8FAVozE5WvzCd4JZdvKH90khQe7swBvImbAOZ1Mrm0=;
        b=Ls6W/qnh6NOPDtd1PPSS1kVU4+610aSaw0G5lGQec6BjQeqqqCERskNd4cwsElcg5o
         kicIYu2vE7+8HIh+y81e3azPH8dFGAVm1aGFzefLD3Aa+1/a6QWgtjtkZ+yDwrbeNHcq
         NDfl/e+3FyZuE7IORGWfS57OUdelckgMhGaM2ySCD1VA5LDxPe2o0+8ZsgbkAwz9gZgu
         vF7DOEA8CDXMRwfeOVt9mzEK73PPiBVYWtkkwit6YIw0bs3SdHXOD2KOOey3EWyUhpHq
         MiDgVfwu0GKXMdfyPWciPln0H8YAV4PSa9+ub3YdIN4Ryly5iJ++pgpQI5Wt/Q9RtqBj
         SWRA==
X-Forwarded-Encrypted: i=1; AKwUvBxww2wqNLmaTmcdbzFmB7Wm3MocJ4JQgimefJtBHglehn9pieTWkMkLI0YsZbbJgxN1glCFW+5xs5xzOBLBxdCq@lists.infradead.org
X-Gm-Message-State: AFuF++m6Y8HusdqPZCwr+sxDMbJ99WKraHwWac84P1ZEiok1WsYPWtTD
	wLHdUkv2jK7WbsL5Wz2XWeNaMVopNCL0g1vqvK6Ak1IxEQIGRAvS1fVlSsaxC3LIoAVpSPCaptJ
	hn470RBOQnAmtFMQsKzni4ws58ggVDtO8QYT/7POBt9Gnfix5XJPEPz0wGpelIRqi8s3dHhY1pp
	ZBsg==
X-Gm-Gg: AYBFou2cDJ0KSNg2lq88kvzXUVkjGqEmqqV+UEQ8wsnFUGrSkXxs0GpZ6B+ZoPM+Xq3
	pCO+MPG9T5Ql7z4cCR9JI3cjsen5jZodFZhtlNDlHlTgg5c3BIi0UIlR/ccInc3TFQhnuZ9KJyf
	k5Mfigqg2eWErz4q8jupqgv4X2kjIXdhiNxSt0p+JYx/Foz0shsH2RoNPDKpnYXtNU7G0IFdIpl
	W/I3b+NavCQjTG4BJtlr2qLa0dRVSpz1nrBjT8MzfMmHOvLIvYwGlx+KYNSwHE+qPkG8ELY810G
	LqhR8yqvLOkul28fqkvWLyMFxkd7VDLwL+7mzzqVdwB/SSUjjEpj4/zzZIdwTlmTk5WxP5R2z9K
	IMefDjeaHw8QpZQ==
X-Received: by 2002:a05:620a:608b:b0:93e:4594:f5ce with SMTP id af79cd13be357-93e8f4d2590mr149448185a.41.1791281346468;
        Tue, 06 Oct 2026 03:09:06 -0700 (PDT)
X-Received: by 2002:a05:620a:608b:b0:93e:4594:f5ce with SMTP id af79cd13be357-93e8f4d2590mr149443085a.41.1791281345932;
        Tue, 06 Oct 2026 03:09:05 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8f28sm81402955e9.15.2026.10.06.03.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:09:04 -0700 (PDT)
Date: Tue, 6 Oct 2026 12:09:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <asTIwPvCldoB6k6M@lore-desk>
References: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
 <179128112868.2231598.3214023601488420681@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iX6v1ENqMiuLe7Dr"
Content-Disposition: inline
In-Reply-To: <179128112868.2231598.3214023601488420681@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MCBTYWx0ZWRfX8anNTsOhwOlF
 hYF327dNS92JgnUF1cU5Pv5gdm8IHPalfgzdNcSBQjqhTn/4EMbGfUGE7imwi7xNeYr+bzpcYQO
 yi3sByiORP9nUumyd7epqehxxPyv4oLnbSqAJ92BkVUYbGtjHb74qG0XDqjGujO7sbVbhCqfuiE
 jVZ3lthv9WdCdCtz0jyluSXyLM1lhg+tnh9p91u+djctO6Cx7yQls07bl+AY+3BDPLTBNyJDYQq
 ssct9nYDRZB3wLEyuIUBr7++6vKqnlz6bTvqXjo5o6VaFMkqIPjC4mTFWSG7ru3m/cWO2RxAMc0
 sa3ZesK0G53Nz44atn03/+pqAj/ion5pRL1dNfeo/QcIqzh67Lz+cLK/PyN6XCL7gpFaSpI+o/G
 KKQWCpO+fgU/YHNZ6G6VMnV6rXA7jcehgu/x2i/Dukhh0mUb3qufdzX0KOGX5TOGuuFDBjisML0
 O86MgzEkZVDLzZ8024A==
X-Proofpoint-GUID: RUnVB5TlRwY2P1YvqwS6VRJKnhkRBI9y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MCBTYWx0ZWRfXwkOFda3JpqEo
 h2oNpkYnj8W3QwtjJxuAxp09D9wDZDybbijESl5Atbg0R4h2GTBtBxyLNtCUaBsygnzFwOUqMyO
 Wx8BdoByUVj8PJvFEBj0S9jabSbe4Ko=
X-Proofpoint-ORIG-GUID: RUnVB5TlRwY2P1YvqwS6VRJKnhkRBI9y
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4c8c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=t5qijVwJ5qrZhGx_HZYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_030908_615661_E3259187 
X-CRM114-Status: GOOD (  23.66  )
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

--iX6v1ENqMiuLe7Dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue was spotted during code development.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a theoretical issue found during code inspection.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested this patch on a Qualcomm Rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--iX6v1ENqMiuLe7Dr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasTIwAAKCRA6cBh0uS2t
rK94AQD1ay0m6XxveCEdXhyNeswr1zCBysXJQMVwAqFY/g0HxAD/f0z+Dv7kiczT
hl+d0FIxP+dRUzNQ35LhC8xB5TtGZAE=
=avE6
-----END PGP SIGNATURE-----

--iX6v1ENqMiuLe7Dr--

