Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16EF1067041
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hwn4JeBMYebP/GCQQ4396drDmip61xqmjZjOmL2zuIY=; b=k7Wf82upOLcfbSYNGBPuSmFIoQ
	ZNMWN4OincAHSMMvJ6wX37TRpeA14xI0jR9RBrfgmrSbNrrPnPbL/x4BQCVb1qPjxZC5pYo1+DMtC
	CiKYQat4BgQDORg65Rz15A/Uup2CxeVSyCdY9VBqXbjalxVflOm7DptL9VdfRgH49Ifm3FJLp3K56
	vkUKzYl9b2so8VL05NTT9OZP+IExT2tToed5fDzOKg2M9CXz2jWu3dwN9ZXO8YdPwC95SdXUOpZEu
	FeA8YgW7NsbDI+pAPvfHQI9XKEQySuyBitIiD9CxTGI+H5nkpeEJgjNcGuZTAlJZxSGyRpWTlTW4S
	TwSOdPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hcc-0000000EJUp-1yPX;
	Thu, 12 Mar 2026 15:06:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hca-0000000EJUO-2Hjm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC2BE61337
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E99C4AF0B;
	Thu, 12 Mar 2026 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773328003;
	bh=BiY9g8dsfUKQ+mbtD+R66zQhvcpqyPZPnsUL5w9nrgs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=lOj8/+OX3Tk20DGLwZqeGUzhkObtUVTTo9Kj2C2wG8HrcshWJE8YPv9cx8+3PKvzS
	 R/+V/4oci/tLLUKm68ApcfFWaen0kxW9aG0xVh6F3P50xUX4Sv80GAjxGQRggPcGhD
	 gjiDRGkOJsKdU+kBVwqv02GntuWnc12cRMDNg6kQ8DyEMu9m5+CWDfRYfRBUGgYHzt
	 lFzvyfwO9H74g0jFLHY0lMz3t+VcAINDuHnwdDlFJoKvuOJebntt+NFAiPk+Y9HoQK
	 cKCCMvM8DIk0NC7mZYQd9y+7c5NFMKv9GEtyQkR425kaSbcD8l60YOR0g62Vi+wucp
	 lSBOTywJ/dw/A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 48D7EF4006B;
	Thu, 12 Mar 2026 11:06:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 12 Mar 2026 11:06:42 -0400
X-ME-Sender: <xms:gtayaRjFODlWltU5aSHBpK6e493ZTwdrMA6eu9-IbJ9A1jFVa07yFA>
    <xme:gtayaQ1P7rtExzIFf8RR_njz5x2_D7QBnBfwn4iZq--85wA3kMMIy3E4rsfCZn43j
    sVO-2Daj0o1Nu0VMKySRUMpzEFeUAlqdwVMko6Kd3GD3lcbxp05LUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeejtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehhvghllh
    hosehpvghpphgvrhhgrhgrhidrgiihii
X-ME-Proxy: <xmx:gtayaUKl5lGqk1v2n8Nnhxza2CrczKY7-qVVqzylmDiRSTSVEDbTvA>
    <xmx:gtayaR-3pYXzMk8tf_dtEhdgW57cgw-txz6eXIyRdVjeU0gO7SdsLA>
    <xmx:gtayafIH6imT4ExgcxXGopbNC-BsHxHZw_8x7KetKBJeRiz0LmuN2w>
    <xmx:gtayaekbd5mm_W2JPwJqDoLU-uLg3c1AIoZk9FG1MZozLijlginC4g>
    <xmx:gtayabNLgavWWPyAMcIamU13ktFa-VXSbX8xZqjrDf7B6jhRdQAY2FaO>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 25059700065; Thu, 12 Mar 2026 11:06:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ao84xJFSPmL7
Date: Thu, 12 Mar 2026 16:06:21 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, "Pepper Gray" <hello@peppergray.xyz>
Cc: linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>
Message-Id: <4141e534-0d81-45f7-a341-98ae1a6dcd8b@app.fastmail.com>
In-Reply-To: <abLGwg1aFyoCosHi@willie-the-truck>
References: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
 <abLGwg1aFyoCosHi@willie-the-truck>
Subject: Re: [PATCH] arm64/scs: Fix handling of advance_loc4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Thu, 12 Mar 2026, at 14:59, Will Deacon wrote:
> [+Ard]
>
> On Tue, Mar 10, 2026 at 03:15:56PM +0100, Pepper Gray wrote:
>> DW_CFA_advance_loc4 is defined but no handler is implemented. Its
>> CFA opcode defaults to EDYNSCS_INVALID_CFA_OPCODE triggering an
>> error which wrongfully prevents modules from loading.
>
> Can you provide some instructions for reproducing this, please? For
> example, which toolchain you are using and which module are you building?
>
>> Signed-off-by: Pepper Gray <hello@peppergray.xyz>
>> ---
>>  arch/arm64/kernel/pi/patch-scs.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
>> index bbe7d30ed12b32..dac568e4a54f23 100644
>> --- a/arch/arm64/kernel/pi/patch-scs.c
>> +++ b/arch/arm64/kernel/pi/patch-scs.c
>> @@ -192,6 +192,14 @@ static int scs_handle_fde_frame(const struct
>> eh_frame *frame,
>>   size -= 2;
>>   break;
>> 
>> + case DW_CFA_advance_loc4:
>> + loc += *opcode++ * code_alignment_factor;
>> + loc += (*opcode++ << 8) * code_alignment_factor;
>> + loc += (*opcode++ << 16) * code_alignment_factor;
>> + loc += (*opcode++ << 24) * code_alignment_factor;
>> + size -= 4;
>> + break;

The logic looks sound to me, although I'd also be interested in understanding under which circumstances these are emitted.

