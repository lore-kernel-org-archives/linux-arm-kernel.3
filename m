Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450EFC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 04:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDELCpQeeRsQjBq8mPwKYZFbE0oodQGK1z39/kbbFVc=; b=ASou2rsmYtP+3I/5rmoF0mhC2a
	H+syeFBG9idHc6AFyRbCsGy74+8+/uoY9X4M2rolEdC0P47fh+Vb6Zz82/mOPqgjQ1Ohi418Gxh9Q
	2mRtlH0PGzn7ktJJebKPxbK+QN1xNbUsKzGk5XoMLTKe8R8g+Jf0Y1xOixZ9oApdY5b7nsr+P0LiO
	VauibmCt2+/ZyFfhlxYeNuNaZO+AGl4kkmlBO4fPZGqr9bar48u/f2f+yEA5Fe6WZ3N6qG7wHr5/j
	ybMeL5Dx08OPy+2bk03LQV3ZfOwFlV/8UPN1u2yYUWLu3DDuatZnTvnCZjTFXISY8AZvXk+Fgiw8+
	d7BU1noQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpg3c-00000006w1Y-1F2Q;
	Wed, 05 Mar 2025 04:08:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpg23-00000006vxc-2FNV;
	Wed, 05 Mar 2025 04:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pDELCpQeeRsQjBq8mPwKYZFbE0oodQGK1z39/kbbFVc=; b=Qe85svnzlMZAx4aQyhcrCLL1o4
	NVHR8cPGhMnl01PyIp30XyxHwpIGbzTC3gR9t09cS0hRmmredZV6owXhOfb9ZY9i7uqmtPBeeKKG1
	BYsBAm4vJL+3Y5JZpNfSnngO+8STW+x+2AvkGY9nZARzko3PxxHO/7xrbIR1FecRg/fk4OAB4BWDu
	4oi+nJ2AH+Ww1SzH2147HatyKbq0ub35PCpt5yh4OVJ6pO8y/w5yYRiw+FaO2QX6FnjbRrk8J2sIE
	BNU1bfGD1M7/Op55tLnvNuI/TTw4/prdSdBSzXHfjBYGwe6ia8rL+POTzHzkzcJ/i+U3GoitK2JSl
	ukh7Noaw==;
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpg20-00000004fze-2AHE;
	Wed, 05 Mar 2025 04:06:54 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741147601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDELCpQeeRsQjBq8mPwKYZFbE0oodQGK1z39/kbbFVc=;
	b=CBDAyr6gphxZstlSVsbNMId1zpTUhZp+pAWmgYDZI5aTdeZ+5+nb+TBqrBtQUrnRTU1GZb
	Si9rzNzGXCDlFD2IIB8gCrmBa9Nc2M0oIKh9vnT4w05EvX9lPTgrhpPOsEq3w5XvwHskT2
	QL282+8PZd6XrT0eT+hA0aCCcL5b1WNM7Gt/Uv5uLkpGedTMgV4WCyrpb2z9DgSIm6AEDo
	pz8reP1rIZJj47AjtbDQDxo/pGlHwaTqqcZZspE8HTRxdAvt38uDCTONarVUiCj9VLoQ2e
	ItwzTTEgIUEqZftGQ1ALfausu/4JWSVp95OuTAKXQ1LTQ7d9/w5eUNfvBHlIsQ==
Date: Wed, 05 Mar 2025 05:06:41 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, didi.debian@cknow.org, chris@z9.de
Subject: Re: [PATCH v2 0/2] Slightly improve hardware description of Pine64
 RockPro64
In-Reply-To: <2630232.Icojqenx9y@diego>
References: <cover.1740941097.git.dsimic@manjaro.org>
 <174104113599.8946.16805724674396090918.b4-ty@sntech.de>
 <757afa87255212dfa5abf4c0e31deb08@manjaro.org> <2630232.Icojqenx9y@diego>
Message-ID: <40aed1a2c3d4015881694e847beca683@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_040652_628467_6B96760E 
X-CRM114-Status: GOOD (  17.40  )
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

Hello Heiko,

On 2025-03-04 22:52, Heiko Stübner wrote:
> Am Dienstag, 4. März 2025, 07:44:59 MEZ schrieb Dragan Simic:
>> On 2025-03-03 23:36, Heiko Stuebner wrote:
>> > On Sun, 02 Mar 2025 19:48:02 +0100, Dragan Simic wrote:
>> >> This is a small series that introduces small improvements to the way
>> >> Pine64 RockPro64 [1] single-board-computer is described in the DT
>> >> files.
>> >> This applies to both production-run revisions of the RockPro64.
>> >>
>> >> The introduced improvements boil down to eliminating some warnings
>> >> from
>> >> the kernel log, by adding a previously undefined regulator and by
>> >> adding
>> >> some previously missing references to the regulators.
>> >>
>> >> [...]
>> >
>> > Applied, thanks!
>> >
>> > [1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board
>> > dtsi
>> >       commit: bd1c959f37f384b477f51572331b0dc828bd009a
>> > [2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64
>> > board dtsi
>> >       commit: 64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b
>> >
>> > I've moved the pcie12v supply up one line.
>> > While in a mathematical sense it's true 12 > 3.3, we're sorting
>> > alphabetical, so it's 1?? < 3?? .
>> >
>> > And yes I sympathize with 3.3 < 12, but also have come to appreciate
>> > not
>> > having overly many special cases :-)
>> 
>> Great, thanks! :)
>> 
>> I'm fine with the alphabetical ordering, albeit with some caveats
>> described below, but the following part of the patch description
>> should also be removed, if possible, so the patch description fully
>> matches the introduced changes:
>> 
>>    Shuffle and reorder the "vpcie*-supply" properties a bit, so 
>> they're
>> sorted
>>    alphanumerically, which is a bit more logical and more useful than
>> having
>>    these properties listed in their strict alphabetical order.
> 
> I've amended the commit, dropping this block

Thanks!

>> I'm hoping you'll agree that specifying alphanumerical ordering
>> for the properties in the DTS coding style is the way to go, just
>> like it's already specified for the ordering of the nodes.  I'll
>> go ahead and submit an appropriate patch for the DT guidelines.
> 
> vpcie0v9-supply = <&vcca_0v9>;
> vpcie1v8-supply = <&vcca_1v8>;
> vpcie3v3-supply = <&vcc3v3_pcie>;
> vpcie12v-supply = <&vcc12v_dcin>;
> 
> In the end I don't care _that_ much, but personally I find that
> alphanumerical ordering harder to read ;-) .
> 
> Because in the example above, my mind now constantly shouts
> "why is vpcie1... after vpcie3... ..... ooooh right, it's 
> alpha-numerical"
> 
> But I can live with it I guess ;-) .
> As 3.3 is smaller than 12 afterall.

Oh, I know very well first-hand how alphanumerical ordering may
look and feel strange at first... :)

I used ls(1) without the "-v" option for many, many years, and the
things looked a bit strange after I decided to add "-v" to its set
of options at some point, but after a short period of getting used
to it, alphanumerical sorting became so logical and useful to me that
alphabetical ordering is actually now harder to read and is looking
a bit strange to me. :)

