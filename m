Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3952CCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q4tREkVd7vcO1xKvc6nTYP1DruPRGr6e3zl/2j3jwk=; b=skigGLa46yNJCM0cL4Wt5XTRJu
	QCwjmtrVPH3UicYD3Lf3HpQzDf3qIh80tEbH3udW38Gxulugiu2yYND1086D7Dhmu3yTcpoVnA/YZ
	CsEe1mzA3m+fzCLUdSUiQmBULAg8DAuMOx+VqJgtKs7xgwiK3Hj9rYu2mrLat2vyuuNRbGuTQ+Yo4
	ZEiyXqjfZtDox9aDAtku7q1y9SmGcsXuilmJj0IyleIIxa3QyDiWZRgz09rZ0P8m6ozGWfIhRKXhg
	wCgQf0bQc8BsTxYhUA/+CEnDooE4hQGWMbF8qpFG7lyv1AQ4m71mW5IqZU661p5Tra+tsS5wHMNLH
	kUDlk0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGymL-0000000FY76-19ar;
	Wed, 14 Oct 2026 13:12:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGymG-0000000FY6R-0b4P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:12:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EB97wP3365335
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Q4tREkVd7vcO1xKvc6nTYP1
	DruPRGr6e3zl/2j3jwk=; b=du8jH2u/dd+oMW82JODINScnacuBtPztJNdXcUI0
	juO//2N2ZZ9lcS+0SZoJz8YfoZxy5bSGx3RwgtWHvljrL0kC0CShR1Kcfm9gqCjM
	JlcKI8Fh0QGcZ9525vAgjI8tQAOChqU5TnXBB36rPST5cBq31dN3Tqz2E9mHmpZ9
	s1vBsocgEN8KV6x63y29d/tcub1ifY5BUrZw+2wl0kPE8k0iVIIslvYKdI1dHBok
	6qVKKmcI4QK3vzIwt79AHLvepEt9a9fTtUAMkjPO6r1aXNE89oz3odcj0DQc5xWg
	DB5IpOA1N88mcpmiFWqb3zVSbB4080RnS97JIKTiy2X6Bg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621qju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:12:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9902e6f65dbso217382241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983534; x=1792588334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Q4tREkVd7vcO1xKvc6nTYP1DruPRGr6e3zl/2j3jwk=;
        b=L8nKjMjx+IXkK9xRN5Vqye4yFL4ISyZiXwxqf0lGHr7FxIKRgXCIRblhqDYh/70OD4
         dD10tB1YDNTmYT59EF/0ieHsBYBvBEks1+SHVXtTyTqTcrAn0s7QUfT+EqH8FCI0BUtz
         balhiQ+N843/nfkAfuRL9E586Gf3s+BwEJ3sS9vq84YgJBZzZG74MEsPb+dlmiapB/wt
         4S0r0LmELJYTU3iMC74BJHOa8MF3iQvhCOsHhvLg52KUk9XoTneAVccIBg1T8Z/lv8b8
         AbL1z2WVcn2FRIAcA/SPKZ3hR4E7mSybXCcJZU0N4PLDCs4/0C6dtNdhNSOkwJ7Z8tW0
         grRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983534; x=1792588334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q4tREkVd7vcO1xKvc6nTYP1DruPRGr6e3zl/2j3jwk=;
        b=dxdL9i8+aeo6fL18uO16yNgyehwgHHBdzn3QUWegm3zdkvCWmNgqArBrVROTq+87vv
         E5KqvDpEV/UGckI174XjKKp+sT8rIYrqFS0JgSqwEqu/018maJr4Zc8eUZ53pveDEWWW
         yHIVN9DG6Pfqu09YB30gh4nCHJD5LeIGH0M5ZFjFDQLXu8JZ2/NqnyWMcSFwc2/L25sV
         BPU3qMsrgqenS2A2RgnE9xigVAV4fSFw5Y0pVueoxj+mfy7Byc8C9U0CcEPpW8P67t0x
         stfvYEhkQcqJPmZMB6nFlUQtwAyfjJjKUDdd/3qeafkq7w48KdpAn+2Klbl/o0d/evhH
         E5bw==
X-Forwarded-Encrypted: i=1; AKwUvBzC4w4klcTCpDZowyIgXeq2sYqK0Dkb6Cogu7JxJ4+BmBQJii5T7XasNG50savQMA+MJn8THXmUjmgQzGtM0EvQ@lists.infradead.org
X-Gm-Message-State: AFq9FYIpg85dlJnyIRk/Z5ju73BPUW0ejiu9NjAgLiyMDWMoZuj6tMIK
	INKa3XBpV2DFTGl6eXX/iFoGBqjiHtISXKdRAFA9w1u30nNtm27y1N67jwJLm4m2FaRZVO7q5rw
	FN+dJho4brNDX6Jdu801QVc7hqytmqk2P576DIsX7ZAM5jbkbSjxJkhqiRf3xgOY2ifMslFeIZN
	omrA==
X-Gm-Gg: AYBFou0c5hrj2P2o/zYma/JxejVAQqwYtbEYtuVNhkKXynLl0yiGFgWYoJ7+L+B7D7e
	T22RYm5Gb5TH2bb5eDts7A31NoLaRUJoCPbg0CZnufBJnx3tbGLz11EocuLSYNNnTTTlB39iPvr
	RQZ30MOsvG5ojZI+/yo/sLQ9QwxCs96iHkqYBTmglSipRBX7jIbXnsDJPrlM2a4oj7Urm/Ti5XO
	ziimWGVa2zWSiLE/EmAApvwqlmPORMcXbwvaQc25X4k6TbKv5WtOwzVHpu722Cfm/1+0f8GQRal
	JDaFn3ZR2guIiTyJVYnT+1z7C1fRyl5VXUg+L3jVBr56QyXKu9MDoQvIccsXF6MA/oQ8GJDeXhB
	D9U5wfdu790z2gw==
X-Received: by 2002:a05:6122:8006:b0:5e9:6d96:a910 with SMTP id 71dfb90a1353d-5e96da64d4emr521193e0c.3.1791983534172;
        Wed, 14 Oct 2026 06:12:14 -0700 (PDT)
X-Received: by 2002:a05:6122:8006:b0:5e9:6d96:a910 with SMTP id 71dfb90a1353d-5e96da64d4emr521135e0c.3.1791983531912;
        Wed, 14 Oct 2026 06:12:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaad1sm11597371f8f.17.2026.10.14.06.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:12:10 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:12:09 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v6 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <as9_qWH-Vw07Zr_f@lore-desk>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SWwpvJ7uYLKp8rBQ"
Content-Disposition: inline
In-Reply-To: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RJ5Uu_rj8lC33sRs5EBAVHaOBq1hVfTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX8svKwxVbzt5r
 SUE9V6u8ya2eBexv80AuNDGTljZn5yErKVyoRnhYiECgROpFPPldthu92jDed4X0NGLZ797pJWl
 LLRl8cmmRq/sKLI+jNLRvPBbnOEZEKQC07h5VamSn6A9zaeddm5RI/IkXZpEwGLpwWADkQy5Wly
 Qq4yR2zdYIR1T11crq8KFAyDNN9dYTqopStPhis/891BI/bhpB2Ql5M5Zrcc12qj7yIAZiTZ6lj
 zmXnbkQoT1C7Q/uu1WXLi/sgon6rNYlYNMPMRYaZiN13a4dYFpIBY5R59fZ0BbwBrXNx9SLIiD5
 aX2laehdpxvx2CXyc3+q4/AABiu7cp5ydN6OOM4y6rfhdYSPXLus9eg2WJx7D/YyCx1t3Eo4hFo
 Yw794woITt/pGIWMrhopX0G/zS5sR1HFKvahOAQ1imIKhss99TADrV1151YwXT/w23SuUTJk37C
 Hhpu1WNDzT4nKfAtDyQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7faf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w_4PuGcMj9oXbp2957IA:9 a=CjuIK1q_8ugA:10
 a=2yseMgosz1EoShofO10A:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX5qxW9gYHjLPK
 u96ZcUbb8opWb/v/p6iG22lj8jDmmmE97BVRYbWu19o20z6xtcP8+DFU5+3YoGhxr7tGadS0QwR
 rhjc+XUwx8nj9bmt6AJiBXlLPEj2qTk=
X-Proofpoint-GUID: RJ5Uu_rj8lC33sRs5EBAVHaOBq1hVfTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_061216_298631_576C3AE9 
X-CRM114-Status: GOOD (  23.38  )
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

--SWwpvJ7uYLKp8rBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Rework stmmac_rx() to build the xdp_buff from all the descriptors that ma=
ke
> up a frame, so the XDP program runs on the whole (possibly fragmented)
> packet instead of the first buffer only. Fix possible rx_q state leaks
> when closing/opening the interface.

I will fix sashiko's reported fixes in v7.

Regards,
Lorenzo

>=20
> ---
> Changes in v6:
> - Drop patch 'net: stmmac: allow non-linear xdp_buff in XDP mode' since
>   it requires some XDP fixes.
> - Introduce patch 'net: stmmac: drop split frames on AF_XDP zero-copy
>   RX' to always drop XDP multi-buff frames for AF_XDP mode since it not
>   yet supported there.
> - Introduce patch 'net: stmmac: drop multi-buffer frames in XDP mode' to
>   fix pending bugs due to missing XDP multi-buffer support before patch
>   'net: stmmac: rework stmmac_rx to support XDP rx multi-buff'
> - Link to v5: https://lore.kernel.org/r/20261009-stmmac-rx-mb-v5-0-c38fa4=
eaa138@oss.qualcomm.com
>=20
> Changes in v5:
> - Fix possible read after bound issue in patch 1/3.
> - Do not allow parsing non-linear XDP buffers if the program loaded does
>   not support frags.
> - Add patch 3/3 to remove MTU constraint for XDP prog.
> - Link to v4: https://lore.kernel.org/r/20261006-stmmac-rx-mb-v4-0-efa4ca=
974e3d@oss.qualcomm.com
>=20
> Changes in v4:
> - Reset in_progress flag when the packet is fully consumed.
> - Advetise NETDEV_XDP_ACT_RX_SG capability.
> - Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa17=
1af9ec@oss.qualcomm.com
>=20
> Changes in v3:
> - Return secondary page in case of error.
> - Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
> - Add patch 'net: stmmac: take ownership of saved RX state at poll
>   entry' from James.
> - Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e=
1ff306@oss.qualcomm.com
>=20
> Changes in v2:
> - Rely on xdp_buff_add_frag() to create xdp fragments
> - Fix bugs in rx_q state recording
> - Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
> - Cosmetics
> - Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517=
d404af@oss.qualcomm.com
>=20
> ---
> James Hilliard (1):
>       net: stmmac: take ownership of saved RX state at poll entry
>=20
> Lorenzo Bianconi (3):
>       net: stmmac: drop split frames on AF_XDP zero-copy RX
>       net: stmmac: drop multi-buffer frames in XDP mode
>       net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 407 ++++++++++++++--=
------
>  2 files changed, 257 insertions(+), 153 deletions(-)
> ---
> base-commit: 29f144016f03608abfddcd6ebaeabafd7aeaadd2
> change-id: 20260918-stmmac-rx-mb-16469a2714ea
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--SWwpvJ7uYLKp8rBQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas9/qQAKCRA6cBh0uS2t
rHAeAPwK1fCt/8yBFk23UATpkL7SEGGsdCm+B2Y2kUT03z9WZgEA3eCds9amV6h7
fRwlHyRLNHXnRlCNpT1QfbCTUE5N0Q8=
=us9t
-----END PGP SIGNATURE-----

--SWwpvJ7uYLKp8rBQ--

