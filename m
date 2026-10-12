Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE51CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oJKRRR72jg/nPW1o56vlRjipAWluWMfTze5tftOJ0s=; b=QH53eLnwNRXacSBnnmayqwv78b
	4azSfMg4qZvazbfNp4Je1vuwBElw2GOjrb03gkGpbUaaQOXTZrnymYD7ZzaNDD5ufdgHuI5jpkaLm
	IGU+yyZr+piNgDj5Zbw2T5ZvrUL6dJdHuzCciWfaTDkLlQ2nOZEO/VC+Bu/ffenXGCA2KkrVbhOcs
	V1Sk6UYfvzv32l4o9S+kEKkDeCR7lzi6ArEf/HdCWdx7seCFlIhXDygeVC8y9ry1dlM4gsUIJPelv
	Yla9MzZA1MVTRXQvwLecYDQvcM/eTBStVKXN7tmfhvseTtz3SJ4sDqYHcqWWmHpp8qWZ1r7kBImR3
	3I4WmXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIKg-0000000AtNT-2Yp5;
	Mon, 12 Oct 2026 15:52:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIKd-0000000AtMT-2vpN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:52:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFeuta2575560
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/oJKRRR72jg/nPW1o56vlRji
	pAWluWMfTze5tftOJ0s=; b=jxBot3MIDZXo+S4b8hKG6K9YVcffzgO8qTGXTEUZ
	6r0GS8QRiOcJ2yVqRwUc9uJqBSRH58zMt1ba3UW5e2A8IX7POOtYiuyZmUKUtYsr
	BB1aCcGF1/7LyEfcPpWqFUe51Ai3SvnneFTemqoJqyydGFVPpaqBiLkMV0fIXL6Z
	Fja2TuT3xoC45r5iWBdn06h/ADKGk6kBvUS+L8tLt0PLdyQq38ISyfx8MvOOyUXu
	1fWd6bpmpiU+yefqSY+cWSbLfWe4igTiOPm7fxNynK28cQ0SewoaNj0uB6CLoHzB
	pu1uFc9lxJ2vDATlJlxfesX9sKvwNF+80olV2vCk013RDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2qht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:52:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so679887785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820374; x=1792425174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/oJKRRR72jg/nPW1o56vlRjipAWluWMfTze5tftOJ0s=;
        b=PHPJmZCnD73SP+Nmq+etcRa8ybsqYS1B9TeOQNQcdUqD2fIRGgVtLB9pVsoN2T9Ect
         on0nHErkqAPHk6eylJKxY3sMykPsS+j8yX5uR9mUsy0ryfr7S4YhwyduYqkMk6JR8C3n
         E39rQ/SmcwOUSYgv7FEkXOQc+TIMOxn5jOJFyTvCqGLXvBh/N089UFTcBgDKlVfIXCc+
         sc2muNMaN23OVgWuQJH+FtFfQR5x8dTVrZa0N7YtxduIqHx5zOK62xORDjYbAjpNw5vv
         cnC8BqwYKr5FcFFGPEL5dCyi8qGaYyxO+mTd4xvXjEvEXsgh9joahhPSgxg3i7OGhaOg
         RIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820374; x=1792425174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oJKRRR72jg/nPW1o56vlRjipAWluWMfTze5tftOJ0s=;
        b=l7rtPsuGu2SUnwFW1Vi9XsM8NUCMuw2OG4xN3ophOy63gaoB6rDg/ZqpvZXLCWuWWG
         y4lu41ZYJ9IGACs0mkmmLIPFOObe26mTNgpDOExRYZ3viNAANzhOtnpdgzGmtK90OY28
         PyQjRbHHQZbzHThyIwpQf/rIB+Kb/48xZ8YbfN5ds8Dwfq+bA4GtmCsr2sqPE8/jyKRp
         UKhJNluzGBJykMxWY1G3MebLSJe93lS/ha0Iz5VT6H9+9wFGtA55sf2PeqPxlmVcv+Ih
         rq7OrjqYtbJ44Ljag9xdw6TI1EuTS2Wb7hU9Yt33VMFUJ/ETgNDQFwmwjeYttfk6I9r3
         hxEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1gslIYHwg9AxkUvJnCd1a/yl+4TUHVz1HIKHyA21Z04Yd7aplqFq3ZJbPeqsD/vUlnR8w1QoJKhR87f0t8IgM@lists.infradead.org
X-Gm-Message-State: AFq9FYL3f7woXAw5/hqfdb2LgVbglWnLalIvwo8oXOqzhFwJTkjZh4il
	0P3zTZAzTOV9hb6RyXpcY/bKCYaaGLs8sICXkxoJUkq+KY+RQSFPCz2iylas5bJD35XLsvjDcHZ
	L/gxRDqGqPcva3/M9naI2Gqh86h9QTq/XgSKq5FH6HspBdRsSyirlnPqLjekMXz9FAoFCWgTVBu
	7MDQ==
X-Gm-Gg: AYBFou0hyCUtglSEXg5UCGbr9SQkrZegn23Jl456Purk2BpJj79nPO7cfAljbvgh2aq
	MESwZrpfoaTzx+ph4GzIrGV6M+tyCMhpT3IJY2BQWJjJdBaml7MeW11HE4YbCgjx9cpa2FIdQv5
	AKHHkgrxRZY0ghjMz+5UnRQSI6P9fjMWC/bUuiXAAV6V+6Mw0cXirQ3nGbNanyZwvHBu3iRutHK
	1bwUaIq8KBqTBLdNiRbE+5J9rI7dXlVDzDEbqIz4IlQbpghHYireGzajC6zQTNqmh0Bt68JbVJ6
	8KGydbRXJkQ2lYFh7FcgqYUWEIzoXQycr9ew7Wfh5kukE4Zh9iKpI7IfQSU0s51QtEJ4pHk3BSa
	crGn3O30bQw1QIQ==
X-Received: by 2002:a05:620a:4383:b0:93e:74b4:3115 with SMTP id af79cd13be357-93ebd248c51mr1554726885a.38.1791820373997;
        Mon, 12 Oct 2026 08:52:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4383:b0:93e:74b4:3115 with SMTP id af79cd13be357-93ebd248c51mr1554723385a.38.1791820373370;
        Mon, 12 Oct 2026 08:52:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm165063f8f.20.2026.10.12.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:52:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:52:51 +0200
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
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] stmmac: some XDP fixes in XDP_TX path
Message-ID: <as0CUyuWNOrV4WPP@lore-desk>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <179181904740.2527009.16307700795539761723@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="or10+gSup2yG4+kv"
Content-Disposition: inline
In-Reply-To: <179181904740.2527009.16307700795539761723@kernel.org>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acd0256 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=aJ77pqhsylUep-8PoN0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXy/nca5f03YJO
 Ztp0E9edCCIsHL7xesHbi0ngsDV/fk2FzCaoCgtOqE7czeUFAgXFBB0c42LIHEsJlLg0Uf7L+AA
 3Kp5EKV+CVAIc1tnxGXXX0B7i9ldb2yWxuFDCwJSytic6iW71Xe2+NS8gv3N7iRo4MM+fbwyUBV
 A+AxU/kH4gxzJ7/A+sln5qtLV+juCy6LGS905P9m18HN7sgoGA4U7VzOVHTQMz1o8b4jbLJQRjd
 rCUFs6Ntxied61aBfTZJo6vTwQ1MHaYCts/4R1gUaHMNvuFSifmlt0+9S2TpwstkFAT2vBAxMlV
 B10oHJQz1qrIqm0tgSEKr8ElHFzgHzuAs4IQgwd+EZ1NIOmngVmE3W1bOYni/mdiyO6h+pb5bfP
 rLDM1qAlQc5U2ZHxUs9Q8edIBpaIjeqtYq8G346G5IhKnCsAVZ5oLsCQGFYMtynaN+3JWCWygTG
 tNAJzjkEHbPJbj/LE0g==
X-Proofpoint-ORIG-GUID: iBN05Olw3jUxGX-55O2XsTR40-Qq27fR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX2rZQtg+BFnhH
 7UgvGf9Aaw9V11gCxpZNNaIj0oroDFbjboZSBfilHQBBUE+e98et7ZTyXDRDtZdhu9STmZsr5bM
 zfH9+nCaYqsGCs0Dc3AdrK1hVO9SoWc=
X-Proofpoint-GUID: iBN05Olw3jUxGX-55O2XsTR40-Qq27fR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_085255_856574_58358950 
X-CRM114-Status: GOOD (  24.24  )
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

--or10+gSup2yG4+kv
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

these issues have been reported by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

they are real problems spotted by sashiko.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested them on a Qualcomm Rb3-gen2 board.

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

--or10+gSup2yG4+kv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas0CUwAKCRA6cBh0uS2t
rNW3AQC2/QeMrn5IqfOYKh+NSNDgIXxUvz26WKNJJ4xN0lVxgAEA/W1AUeFJcriu
MA8eHjFtt2TSRtfyi2A3pmw9qVuFYAE=
=Ixfu
-----END PGP SIGNATURE-----

--or10+gSup2yG4+kv--

