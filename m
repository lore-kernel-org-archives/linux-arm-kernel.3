Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7730DCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHKD0TCiV5FgOYF1uVO9X3gA7dIJfpFlI7tnzN7DHOc=; b=wQ6wINSSOdmE9TdA7xnz2fSpqp
	eiK+MCGMpAfJsjzi3yzrxveU/Cs2tEXixE120NHcpOzMKaxnE0DCnsxE5GmMy3PTyWUGTzzFzmfCQ
	bbVQpgF+GhcAg+jWz7Sc6URed7FDa/O34W8zkUZT5ng4fm0huVi7SFNdAJbpaEeB9o4c+sIS/028V
	HXJ6kCAbotaLe4c3kn4GVgtoNKGxdj52YXHzMYFIg8gSIexrpUBoVT6XjHRaBHhSuYGQ6umip7MnS
	B20DvO2BNU8r/GAKVdzqeBRTQUbl29Ukyl4jmU8ktDdwhnoa8EVnlLGQq/78UXL9NRAXJBQkiE6JK
	IYMbqo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDz7N-00000000AEb-03qQ;
	Tue, 06 Oct 2026 06:57:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDz7K-00000000ADa-04eg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:57:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eHAY3433089
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 06:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QHKD0TCiV5FgOYF1uVO9X3gA
	7dIJfpFlI7tnzN7DHOc=; b=ZRh0DRuagu10jXsr/2CwnPuZzfrGoEcM7LrYOcqw
	RAEVUKsozM+B54RLojLSAaEM9QBuQOSlf3oF6ZUqg4ATlgw3RXjKKy/OCF5h9LaH
	nu6K8m4RIPv1DW+Cg2RMZ77OXRmwQT3GytBKQgHTW/oDZUY5Mkjow6GfB22YlAWA
	2XPSOUT2TBl1L+S+ORW+wKhb1jv6CPHUSHAAQyogjVVFSPrTF03vwTQ4jkSdgd/h
	v5jzvAYquZdZXdB15aiJ5kurpDESGaf9qplvKnl2KPagAzp9AWfl1dIsoTpYFewU
	ElSzbrywPLZgW3mfATZGFqC8mvsJF6ncM+RbRc/WEEJ3JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cvnkgk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:57:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so404352285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269856; x=1791874656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHKD0TCiV5FgOYF1uVO9X3gA7dIJfpFlI7tnzN7DHOc=;
        b=Map5ApeJN1Kpn6tfvMislVO0oCZm3THJ5D2h8Lu1Ze1hUiTtHBIU+hkUsXl4ehxKhM
         Kr6ONWpvQDstEprvv+u6XN4rxyKs/VM79CISUJJWWzlLDBJloei5l2EyATgzOY+QL33e
         Pv28Z04+/m3NVufJla3EyU0nYmHNFC4fL0Sv5rgq5ZXYMX0/ocYEyg14nlmdmz8n/Mt+
         TrewwRrnpdKeJmf6FaCVgJ0WtzCQgl7vcWNaMkPL6TVrpatkkOHcMp2I9avG4oQeEMRI
         iUoRPSVBLFI56yp2yj3DmdoCT8jlqESMN2vengXe7PEhrHpXpTijYnymtu8GP6txv2te
         lcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269856; x=1791874656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHKD0TCiV5FgOYF1uVO9X3gA7dIJfpFlI7tnzN7DHOc=;
        b=B8XJ8l7MWp/BX9qoEOzRMsr/GbMv/iL8TFekBOFae793rdNZtrz9TDaCUHZbYm56sr
         eYUtW+OftbvXa4OxlBiVOQRj7cGQ/tP4eu+f9ag2F4fP37vPCR3NIU9SQcscV4fgXFRr
         N3UI2xyOYa4M0PjURn+wyiPEzV6Jd8CYFyIBtqVc10apcvQ003qRGn1BLZGKz6AKjk1+
         s+DnKOVNEsdQhWoOYGDuh71t1au4wrJM5G8B564fJ/ATaghnUaPuNJ20KSUDVUb+SfRv
         H+aDYxoghN/lDUoTLV4V9ADsA3c7unrygnJigNeauAiETtn16WOZ+us8rnN9ePJKA5Lx
         yTgw==
X-Forwarded-Encrypted: i=1; AKwUvByhhBskGPS4DmHJ14L8OCgF7BSeO4j4u1M1m9ZxpzZTlKZrbR+0iYTyRzaDuMh2jOUKdCyerE2ccxODVsmL4TCv@lists.infradead.org
X-Gm-Message-State: AFuF++k2/PugJ4YdhAzsTLPyP9LTLZysb0nhvvpWQVnGCssCcbF9/Uxs
	GQExdCzz4Hs6gZcRDg/LOnXVBzmqZD5v6suQQe1VAPkgarCpyJElSj519unfjess62zTZT76yvC
	gG+G/5Gww/xxZADdPF+h5CKUtPG82Kt5Xm41NE7JLoyL+N+jsNQtmBBoOMM6Ktz+w+YaLvkYTh+
	g+qw==
X-Gm-Gg: AYBFou0nFp58f5mWBmboifHXbvZc8BQY3qc2SkpM8JcmItJX3UcTfrURcm8KEC2hJ85
	d+Duk3TsKetCRNqj3FjuT9ccz3uaHempn5jrYFoNdUup3Jkp8pgL/3JPtiTqHg4+6xYJj2BTOK/
	K2s5/vzii9VMLQ+zN7n7/YCAQrvzuSQyJekd4QLb28cBGJF153W7fg+qQ9niROngXL3rDYwTYg5
	oNzhdAVDRd1cRkVtjjwMpdtzby99yku9G34dgWfomt9X2B6PbhrKMO65R7h4AXtUCVR6MIxiZ02
	8iroofiJGIXqUKTzFk+0pROmDUkT9BF28MxWZ394eDIjWSTGHUglxcyfJXWDlYkjF+iQmBuaaV2
	278UkgBVuqso0lQ==
X-Received: by 2002:a05:620a:618a:b0:93c:6450:9cec with SMTP id af79cd13be357-93e85ff3d0emr344086585a.5.1791269855931;
        Mon, 05 Oct 2026 23:57:35 -0700 (PDT)
X-Received: by 2002:a05:620a:618a:b0:93c:6450:9cec with SMTP id af79cd13be357-93e85ff3d0emr344084485a.5.1791269855325;
        Mon, 05 Oct 2026 23:57:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6308481dsm9551366f8f.3.2026.10.05.23.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:57:34 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:57:33 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <fustini@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
Message-ID: <asSb3RNcityVg6ia@lore-desk>
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk>
 <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PY9H+lOa39O6BaT9"
Content-Disposition: inline
In-Reply-To: <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
X-Proofpoint-ORIG-GUID: sPzugd9E19tUwN_Afx26GHMD_NrY7xGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXzQegdVA8DeT3
 bC4OyI3o+ICBlLf1AC275WibfTUXNIRnz/GAqZZv7oyeIM/oEs1N0ELOAwKQCAy52YhuXYGtjOj
 B4PUwbGXKDTH6hI5i41dMjwrL68QKVPcGGA1ix3k06JPTH0wdFY+mMfxZ4frp9I4OMaeDFXGn5f
 FOPdoatbhEp+DFLH4xTs/xnZkBtTYQLUi5kPnzvqrhAnQEl4LylN81TUFoELKiIsJXmn8Vhh4lg
 p4dCjlDsyaZRTGZqWk/INjzzUR06sdbATJ/MtWz0+kBNYaum8EBp6yDwUvzRRvgEqCMvZsVbLwM
 6AV0d16sGJm5PK+l/9pAohjLuLqojz4JJfXhSZCrEFT1ydbV1QS/TOFxfidyKLHabDESbWPq0rw
 k7wbGz4WG3I1+x8ZWqnttFjaPBSv8m07nY7E6lRbfy/2+7wDyWO6uqCM+lPgcc92x020Ugr03BP
 NTDDoRsrPNG/+Ui1wKw==
X-Proofpoint-GUID: sPzugd9E19tUwN_Afx26GHMD_NrY7xGo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXxQr94cqvOmyC
 g71Lo7OFbodajKmQc4SbjJztRBc53rBtHKIl0mGiopCRQqBeEjh3LPBKIU4txpJR29/rgduUw+A
 5WiIi0Ba6smcyB/wIrIP/gawZVVGXoE=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6ac49be1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7Ag77JHl3iOYbQ2bdk4A:9 a=QEXdDO2ut3YA:10
 a=7pNlf7y_wykQaJU8uk8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_235738_065248_B9B5E6B7 
X-CRM114-Status: GOOD (  34.96  )
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

--PY9H+lOa39O6BaT9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On Mon, Oct 5, 2026 at 4:53=E2=80=AFPM Lorenzo Bianconi
> <lorenzo.bianconi@oss.qualcomm.com> wrote:
> >
> > > On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrote:
> > > > stmmac_update_subsecond_increment() ignores the error returned by
> > > > stmmac_config_addend(), and stmmac_init_tstamp_counter() discards t=
he
> > > > addend and system time programming errors, always returning success=
=2E A
> > > > failure to program the addend (PTP_TCR_TSADDREG) or to initialize t=
he
> > > > system time counter (PTP_TCR_TSINIT) is therefore silently swallowe=
d,
> > > > leaving the hardware timestamp counter in a non-running or partially
> > > > configured state while the driver keeps operating as if timestamping
> > > > were up. This matters for TAPRIO/EST offloading, which derives the =
gate
> > > > base time from the hardware timestamp counter.
> > > >
> > > > The same hooks are also called from the PHC callbacks: settime64 and
> > > > adjfine drop the error and report success to clock_settime() and
> > > > clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> > > > ptp4l/phc2sys.
> > > >
> > > > Return error codes from stmmac_update_subsecond_increment(),
> > > > stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> > > > settime64/adjfine callbacks instead of silently returning success. =
On
> > > > failure, roll back the partially applied configuration so the hardw=
are
> > > > and the driver bookkeeping stay consistent, and report the reason
> > > > through the devlink extack. Also guard against a zero sub-second
> > > > increment, which would otherwise divide by zero when computing the
> > > > addend.
> > > >
> > > > Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> > > > tstamp_config, systime_flags and tsfupdt_coarse) when (re)initializ=
ing
> > > > timestamping, so a failed init does not leave TX/RX timestamping
> > > > enabled on a counter that never started.
> > > >
> > > > Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to gen=
eric HW Interface Helpers")
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > > ---
> > > > Changes in v3:
> > > > - Do not run stmmac_config_addend() in
> > > >   stmmac_update_subsecond_increment() error path.
> > > > - Return error from stmmac_adjust_freq() and stmmac_set_time().
> > > > - Reset hw ts configuration in stmmac_init_timestamping().
> > > > - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-added-s=
ystime-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> > > >
> > > > Changes in v2:
> > > > - Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
> > > >   routine.
> > > > - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-s=
ystime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> > > > ---
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++++++=
++++++------
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
> > > >  2 files changed, 84 insertions(+), 32 deletions(-)
> > >
> > > Hello, I'm noticing that after this patch was merged into linux-next,
> > > boot seems to hang when ip=3Ddhcp is used because ethernet isn't work=
ing
> > > on the TH1520 Lichee Pi 4a. These lines get printed in a loop over and
> > > over
> > >
> > > IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] thead-=
dwmac ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > f2 mtu 1500 DHCP
> > > [   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmmac-0:01=
] driver [RTL8211F Gigabit Ethernet] (irq=3DPOLL)
> > > [   24.912780] dwmac1000: Master AXI performs any burst length
> > > [   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety Featur=
es support found
> > > [   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init failed
> > > SIOCSIFFLAGS: Connection timed out
> >
> > Hi Anirudh,
> >
> > based on the reported error, stmmac_init_tstamp_counter() fails with
> > -ETIMEDOUT. In particular this can occurs if:
> >
> > stmmac_init_tstamp_counter()
> >  -> stmmac_update_subsecond_increment() -> stmmac_config_addend() -> -E=
TIMEDOUT
> >  -> stmmac_init_systime() -> -ETIMEDOUT
> >
> > I guess we should understand which one is failing and why it is failing.
>=20
> It seems like both are timing out, both config_addend
> (PTP_TCR_TSADDREG) and init_systime (PTP_TCR_TSINIT).

It seems hw timestamping has never worked on this board, it was just
undiscovered since stmmac_init_tstamp_counter() was not reporting any
error before (this is exactly the goal of this patch).

What are the output for:
- IEEE 1588-2002 Time Stamp
- IEEE 1588-2008 Advanced Time Stamp

root@rb3-gen2:~# grep 'Time Stamp' /sys/kernel/debug/stmmaceth/eth0/dma_cap
IEEE 1588-2002 Time Stamp: N
IEEE 1588-2008 Advanced Time Stamp: Y

Regards,
Lorenzo

>=20
> Regards
> Anirudh Srinivasan

--PY9H+lOa39O6BaT9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasSb3QAKCRA6cBh0uS2t
rCKbAQCmJebvx52SDrck5zSXUdLfieTjYBeBL6g808K3mRR84AD/aSk0GzNPwVbF
/lg8BlYmykmbAcOk/AZYVZ286hVsugE=
=Gf8I
-----END PGP SIGNATURE-----

--PY9H+lOa39O6BaT9--

