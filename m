Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7FED3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 07:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q37g8QgWt+j2HV/pLcvrn2Ak6fe/kWgelecDKdzYBCs=; b=sg5b3pHFkXJrRuRv5uD9fcguLf
	7TshFHbce/sFklLgptT0i2R7+LWK7XkeGlrzrfquWUSR+TNqcD76D4jK5FUo7NPJMNFpg/iaSq+ZU
	v17kMxTU4Ua5bfmJ6VHXddyNKN05OYp3XYfyyoJJVe4sPGJHAj/djeWsycMx/k4+9fh0LHXj2h5iz
	DCQ0tQazmdNZR1q2Rjup4IphYFVn7NbIxus0MtlMsOeCoUzugaa2/WEVuXN3HQJ6eY1XNchLDgees
	Vh96ZKekt7MU5ucHfbM5sUKdUNROnD5pwpc6v0fpRWJ/f9zGJlSuysQmN85RtCqDACKx/9HgCnU3y
	x9OzVLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7lq-00000003R3e-1drC;
	Mon, 29 Dec 2025 07:34:26 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7lo-00000003R3D-0CnA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 07:34:25 +0000
Received: by mail-lf1-x141.google.com with SMTP id 2adb3069b0e04-5957db5bdedso10179892e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 23:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766993661; x=1767598461; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q37g8QgWt+j2HV/pLcvrn2Ak6fe/kWgelecDKdzYBCs=;
        b=vOWsOVz5+GfvtoDP3WOKu614nGBuVPz+V1uTVuAFplpjxfvpb/AAcyTXLpQFSyEWM4
         yr957vctqJQhVEhWAtXESnpJ4PZb9dvEFd8h8DdF1XQYH2fFSsgAgUwi15D1DvNld4Xv
         HVQwagoBiuliN0QYUDPxmLLQ5NKgz0VNQ/8mzGaJXmfMnnWEDfpXxti6RpnjMe9SnVLX
         5iUrkQXg/Z+PhEIXztVaeUU9EENVfkgT1e+RrROpnuRNbncn632PxF8eSLOliw4mTqO2
         3PLEaCYXmx2as2Z4DBTbcGXl/feJRz0cgkeJhW8kTQRRQXJ0gzjj8fQPLEG8FUrROylE
         XCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766993661; x=1767598461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q37g8QgWt+j2HV/pLcvrn2Ak6fe/kWgelecDKdzYBCs=;
        b=j6X22gPI428oHS2WgXy7vDcxWLB9ml2Q9ifuMjLiJn7ziCYtU25mxKpFRCIK0U5fFz
         YzdBmUAMaup40XyITCSUyFKNnvAje434zNQgcqfiJkvaHC104WeBCPmvfdPdUmSxlkYc
         QjdZXhDdfeVa2N0JDF+M5KPwTwHTym6AlDzmX/B9KcL5cPle1mrQSVX5MvqYs8L4RG99
         wiImynEbqw+UaA+sMBuKphKWkZ484MSWZsai0Ubg5oivd7E93DxJzQWc/RRvqA79wL+4
         EcPFIoIdOkY/yk174OOdoTFgjNvmHDfHvPk0kiMDLOm0UF78cfDg1i2eSPNiKj9Cwvl6
         z1gg==
X-Forwarded-Encrypted: i=1; AJvYcCXmsnQ2+qIuHrYIgmKR0unYcgKa+FeIfJ6Qo3HsJzWHjafop00HB9xQlmJyjuusEAdLW0b1BeCLr2roKmgdmQhT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1y3E0pFWjbPUY7SN5aGqiE1tOTBbDqO7PL2ZsnhsQLPFIQqLb
	ejEvazfcx6Zt6kvfEHJFoPtERkA4Pmk4WRkwUcltT2eTrSUr3YHwS+RJAAOQ+txRT+k=
X-Gm-Gg: AY/fxX7XOEYCAybaKB1mtv0edt//9MTutLxOLOlY+kZNIx4l24zlBF5a3vQju/NiT7I
	AxpEmunoVCXYjzN/16jR4eJcJsAqxdDOgllItebyvH8Qnd75cF549do5VWPB9PFJQnb7l2Vh9We
	RRAiC0a+LWKyXhGq1G2uiFum1ugTh6CGnBYIgHaudnX0oS2sqooMe2hTglm/WQygYLsvy6nOmoW
	LrexGpYqbRjFIjDxRVtQmcCYktO/17Lqdq9ioCY8M8+BjqqkfDPo+OVZqRUKkjYPhnq1MMcDEA3
	iO+6RA4Zy4EiQwddqYGKpErxt6Cq5Zy2b/OuvBDm5ZqAG1tWRwK1vlpdN61PPQGc1uYvW+4fqI+
	VqubiiRdhzMMrtXji3IlAfXMvq2//l1H9bnoRHw9tCss97xY3NdjFqmgYKMmmRV2j05B1qWMTrF
	XBjnD1X8VYPgk55lkVowlfL6gbcII79wWIwb74gpBK7uPOAMyKprb+j1g=
X-Google-Smtp-Source: AGHT+IEIM5ktjNCuMsd9Ti0erULFwmS9sn0NxetYwu0EQOsLWPvUjfGb363kcaKJ5lQkLK640+7QoA==
X-Received: by 2002:a05:6512:3da7:b0:591:eb01:8eeb with SMTP id 2adb3069b0e04-59a17d727cemr8726844e87.46.1766993661259;
        Sun, 28 Dec 2025 23:34:21 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618cc2sm9036606e87.64.2025.12.28.23.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:34:21 -0800 (PST)
Date: Mon, 29 Dec 2025 09:34:19 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: get_maintainer.pl and arch/arm64/configs/defconfig (was Re: [PATCH]
 arm64: defconfig: remove SLIM_QCOM_CTRL )
Message-ID: <aVIu-9cnyXXBkpoE@nuoska>
References: <20251223134807.3543642-1-mikko.rapeli@linaro.org>
 <c06878f7-bb93-4de2-b54a-e97fbc1a333e@kernel.org>
 <aUqgFCgmBy7H9yW0@nuoska>
 <4f99f3ba-ef5b-4163-ad1a-99527dd96f8a@kernel.org>
 <aUqo9AV2zSJqr_oE@nuoska>
 <6f425362-ad11-43d3-b74f-4576a7dc9954@kernel.org>
 <b8efa1f8-1e6d-4069-a57a-ab58d5dbc2ce@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8efa1f8-1e6d-4069-a57a-ab58d5dbc2ce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_233424_129720_DE2059F4 
X-CRM114-Status: GOOD (  20.48  )
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

Hi,

On Tue, Dec 23, 2025 at 04:30:04PM +0100, Krzysztof Kozlowski wrote:
> On 23/12/2025 16:27, Krzysztof Kozlowski wrote:
> > On 23/12/2025 15:36, Mikko Rapeli wrote:
> >>>
> >>>>
> >>>> I sent to addresses reported by get_maintainers.pl.
> >>>
> >>> There is no output of get_maintainers.pl for this file. It's one of
> >>> cases where script does not work (I think already documented in
> >>> maintainer soc profile).
> >>
> >> Sorry, I don't get it. This issue is a generic one since now arm64 defconfig
> >> has one unknown option. Tools which check kernel config for unknown options
> >> trigger warnings when arm64 defconfig is used.
> >>
> >> If get_maintainers.pl is broken for this file, then please fix it. I don't
> >> know how to fix it.
> > 
> > No one knows, partially because it is very, very difficult task, that's
> > the problem.
> 
> Ah, wait, it was fixed already! You just run get_maintainers incorrectly
> - You cannot use git fallback here, it's pointless. You could have read
> the get_maintainers.pl output.

Could you mention what is the correct way to run get_maintainer.pl then?

I don't contribute patches to kernel on a regular basis so of course
I can make a lot of mistakes but I tried to do the right thing:

$ ./scripts/get_maintainer.pl arch/arm64/configs/defconfig 
Krzysztof Kozlowski <krzk@kernel.org> (commit_signer:27/70=39%,authored:4/70=6%,added_lines:13/116=11%,removed_lines:7/43=16%)
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com> (commit_signer:14/70=20%)
Geert Uytterhoeven <geert+renesas@glider.be> (commit_signer:13/70=19%)
Arnd Bergmann <arnd@arndb.de> (commit_signer:10/70=14%)
Nishanth Menon <nm@ti.com> (commit_signer:8/70=11%)
Eric Biggers <ebiggers@kernel.org> (authored:5/70=7%,removed_lines:5/43=12%)
"André Draszik" <andre.draszik@linaro.org> (authored:4/70=6%)
"Nícolas F. R. A. Prado" <nfraprado@collabora.com> (added_lines:9/116=8%)
Andrea della Porta <andrea.porta@suse.com> (added_lines:6/116=5%)
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> (added_lines:6/116=5%)
Fabrice Gasnier <fabrice.gasnier@foss.st.com> (added_lines:6/116=5%)
Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> (removed_lines:23/43=53%)
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> (removed_lines:3/43=7%)
linux-kernel@vger.kernel.org (open list)

and collect the emails from this output and fed them to git send-email.

Cheers,

-Mikko

