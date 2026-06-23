Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC9CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqrXdIBWaYUNTFvEZ3cgKka8p/hM1w0g8WUM2+DGnbg=; b=Z+SMRLL0Uhk6561ECmpPhruGxR
	KbdmwenqcoRDqBPC5FsFP07Sd5PQpiAq/zizPbYTpNjk+dLWhY2f2LGQfBhSbgy8UDDvcbkYzz8A2
	VNHfdQ20ORuGXHo1HMUMwWOlSvQfvLmO4hfcupaBGc5gyVwD/YKr95dBSiiUmPcxDBlpdKH8lYehL
	LFl9C3FcgvV/QVp4arvmpFsQXPfeZVWA2qJAxSOsdT04SOP/Fr5V6RSyZoGqyjL8z/bzkkqdsXVgd
	peH9gzAbpMX2KFKniXgThyEaUFkgAurFHqrsmut67+UYDjuROoV0t47WufSigzinyVt7SwYEWsuBF
	JjA7+1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxD5-00000005z3U-44S8;
	Tue, 23 Jun 2026 09:14:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxD3-00000005z37-0mwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:14:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c0868ca8738so634756966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 02:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782206058; cv=none;
        d=google.com; s=arc-20240605;
        b=gXMSQF8ZMkL/EgDOhhm8Wjewn7l9I0f2yYOpiKwHVeFd+smE1nM4yUOMjjbNnD3cfS
         TRYM/1Dxlbjreeyma75uEYFWXNo2Q6uZOzBua7a9W1u6kUvXK+9hsCATfQvYi7Pusjfk
         Ur74A5j0eeX2Rdrk2QPLuPCYNsgEdexs1ng7pG3IFvmYmnZYS3goreUWfu50f+D88t8B
         T9R/4HeEOcd4+wuzHVDwrQ7KgcybwLTouKm20v0lnZ/p5gIoyVz03p0VXKKFV2VwZCcA
         HKRcU/7CCN1POG+hyQ/2seT4Tmt2ud8CsiVvtu5DaHP0XYPd79V7H8/3T7TDS9hIYT0V
         4AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EqrXdIBWaYUNTFvEZ3cgKka8p/hM1w0g8WUM2+DGnbg=;
        fh=csJ0iJT9NRaIh1Wx8yJKkP0vkNU0nzBeWi2cj17LMpo=;
        b=eTRmIqjm42NNsaRGW+xNkxVCCMbNB4BlVoeK2hrsN2X/7QKHVzyXKbTTHJACpaQGnt
         C+XUssN/9k+ouH0demF+oN2oUeRQ8j+1+OvMNlYRVTaqCoMK+8V9dgQKJqbkoLoatfSt
         Y/M8/vH5xEA8lXEgNc/ga8fCFsMtnWgeQ8HhkwskcNEW8MbbbT4jDPyRSaKw9w+E7VYY
         MEYSu4wHdpTcdk81BBkNIz+Y1BZo18RUGKf0+auhCPX2CtQu9QBI0u3QWoAtJFTmdY5f
         fd29hzfypCCQBMrKi/HyVyJ3gbi5Zda998jffmo7ey7M6g/29BoY4liOfaJ8zGyAd20o
         R7RA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1782206058; x=1782810858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqrXdIBWaYUNTFvEZ3cgKka8p/hM1w0g8WUM2+DGnbg=;
        b=snVPP61uH4C27G9UJy9gwbd3tFR61YXy7ZAt+Z5tsXroDM53EbIbZ2lbZDFpoElCd1
         qjUdovDuMv0EL9fC+oxwM1gh0nd/wko31Nxpp4Wf6JFc+Or7IyVM+ecl5MPSctxHIsXw
         Jx5qf+9kUdL1JOGrH1CkgN4WoI1CFxqHexMjxsoWes8KHiCK8+JlbcdvaLGSAcRQDLKM
         IKCK4Tk0tHxy8xOemF6OjSkjWFRFUSS9kBZm8s7mQiqv0KX3iEkaiAbtBl4XSm9hxAsS
         hb9njhd3YKl+gHRX5CmwT25h184WZByfBklHjjkfhdADC4PGMFTeoDOUR6uX4/yZQFcn
         ex6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206058; x=1782810858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqrXdIBWaYUNTFvEZ3cgKka8p/hM1w0g8WUM2+DGnbg=;
        b=GzOKvWd2bAzV3nKLsdZvu6IMgZ8vUv4I337y0sxPCG2lwsfywgi40a52Zw0SYHlEDj
         GvhV/C96GEwIxydATydOkc0zXAJoYpTrPUlaiEbbBUIbcpVynwRIEzpzHESLI959fKb9
         AOtIdvPoVL2e1q5PfA6XeWbWnUH2vTQ2idHIkQMkAjiC2j0hW2y/5MK/fNkokeEBUlEt
         r6GPzxzASwmpm0iLB0y6tkxDyMWX1FcDsNRRFh+uhyxiqJexBRcrUYQ81BpD2Sa6FnNB
         A/4VIdaL5C/jp8wkZ073bETbLZQS6nwV0Re10nIflplMm3Ci76PQP+OcuxAZ/0EEpBMu
         AatA==
X-Forwarded-Encrypted: i=1; AFNElJ/BMF0DEM3Qc4qnuRBclDhbOhcBw4kFR3OvU10HTP0dEJ4OS7bDZIUeV86RiBdvGPG3gSMQlFuH1GHGzd8ZBDIc@lists.infradead.org
X-Gm-Message-State: AOJu0YzunYmaNGIvtHQila0SXGAhYSURK6p/oCYhPh2+Vt0WHacl+R7l
	v9+OFT8qtAbg3dsV2vl8vp8D12AkK+etv4nUS344AWwnChNqjWr+BlcsMHsjtYM9xsCxJfxGdou
	TUtwfLfBMzeKQ3qXqV2dNVAgzlVWRvqjarrTRqADmSw==
X-Gm-Gg: AfdE7clgkguc7vZT+Ta2jrQiexaX9dihF/+X4VjzBs2sckehK1qQz6NAtkp++IAVNX9
	6Ph/3jBlkbCyZBTIx7XoLiCaYED31vzvSSm1VJq+c97UL7R7kUAWMVQj3+6+NZwsqgrLJ8kbV2N
	5H5ZIiFEn3JU+FC9WGME4ikcNKDP0FWRcKLhRL9UDkvnd4zRt6dnSk4Kw05Sx4AQtj5qNID0kFB
	O0DRj7ljEcMjLFLmczvGkbfzI6qnT/HKMQqt87bBITFAT6OFziaFi0iisDOXJazIUinWbvEDOF2
	0Fzlfe3eH+/VDZHq/nExTJVmfO327dWQkda+G6QtdmhHMtoVs00RkZ/k8h720V4L
X-Received: by 2002:a17:907:c247:b0:bf4:6aca:7010 with SMTP id
 a640c23a62f3a-c108f0f4785mr83260766b.45.1782206058319; Tue, 23 Jun 2026
 02:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260611101151.426050-1-robert.marko@sartura.hr> <20260613112940.05bba5ff@kernel.org>
In-Reply-To: <20260613112940.05bba5ff@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 23 Jun 2026 11:14:07 +0200
X-Gm-Features: AVVi8Cck-vTeZobR-VkfMvm6BRpNAQv8kjjU388CklAJNNSpClj-lw0YEXhcwgk
Message-ID: <CA+HBbNFNCpGSMkEjFOhDcLW68G8aqubsNb-gZ2BRYd_m9z3E8w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: sparx5: change ndo_set_rx_mode_async return
 type to int
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, sdf.kernel@gmail.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_021421_254406_8ADB5AFC 
X-CRM114-Status: GOOD (  13.23  )
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

On Sat, Jun 13, 2026 at 8:29=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 11 Jun 2026 12:11:13 +0200 Robert Marko wrote:
> > Commit ("net: add retry mechanism to ndo_set_rx_mode_async") changed th=
e
> > ndo_set_rx_mode_async return type to int, however it did not update the
> > SparX-5 driver.
> >
> > So, simply update the sparx5_set_rx_mode return type to int, propagate
> > return from __hw_addr_sync_dev or simply return 0.
> >
> > Fixes: d90b85c23b3d ("net: add retry mechanism to ndo_set_rx_mode_async=
")
>
> This commit does not exist, as I said in:
> https://lore.kernel.org/all/20260507091012.7eeb17f5@kernel.org/
> the first two patches of that series were _not_ applied.

Ahh, sorry for this then, I had those patches applied locally.

Regards,
Robert
> --
> pw-bot: reject



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

