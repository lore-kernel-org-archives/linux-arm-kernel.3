Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26091C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k06jUYDMqKxGVP7wovx5h5JsVcIo+gSmbwAwSo1yGQ=; b=PseKV2hdOt6NAbVPcMbdIkvvmn
	sTun3Qtry+PzFpxsGeDI9+TXcHVhsAZA24gGw7/lVdksgesp/9K/gANOw4dMS3OtEDW1jrsnzIZc9
	avBlxtB2/aEOP/APEb4B16OlsPl6iEBcl9G/WFy+FAbv7ACOVyHAhwHMgEmnznE7r+gpIv1NiMMhv
	Qv/Zgnwo6yNYI4HHCH/oQpTH53wxe1hGzKuAfldFeIrIRw8ra8sL7yZu80h8CLIWRnf3cKUvlhcpo
	w7zpa7XexnHSNlZ4/JU3PIfmcKxJt1odQeIN2VYcnqusNt9JzCJRK2GNpgUEY7PlVcAjf9fO5Nm85
	tsvAoxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvw56-0000000HFre-2pu4;
	Sat, 22 Mar 2025 10:27:56 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvw3P-0000000HFkm-00pi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 10:26:12 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 4987B11400E9;
	Sat, 22 Mar 2025 06:26:07 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sat, 22 Mar 2025 06:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1742639167; x=1742725567; bh=4k06jUYDMqKxGVP7wovx5h5JsVcIo+gS
	mbwAwSo1yGQ=; b=t9hjJIaZzhAb1sTydGWTipJLOFWuRXeGvTCZiY2Wa0w1ZXxJ
	2OqUcciKnI3eTrGrgOL5sC9mRUqToBcEz0aL+MvPfmgB2clmjg30512g4/0xEB0m
	51NctuA8mSeDUrZ0dTA+O45AA4r0YZcAwfsBKCj2rjRK1oaOzy0bfBzlzRr+++3P
	2v7AKCcGv4z9xJMql/YZnb0Sg+4bkZ94/x5Tm5f+ClqbgfoDnPs9ZqHD3Ve86Iyg
	YcHSrKEeZR0cbsbJa6w2KgTr+tyZDUXngdSVbsKFOA9VDo2fx4wBfQrvJbTOM/ZW
	csBo2UGafDBgICynM/T1ek+kT+uKjDqe2ZUz5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742639167; x=
	1742725567; bh=4k06jUYDMqKxGVP7wovx5h5JsVcIo+gSmbwAwSo1yGQ=; b=J
	MLYl9t785lSpiAA96/nVBW2560PquizTiJ8pqPArqrjCo5bfyzZsgcSX7m7FhXgo
	UEyyVerugktrDSXSfMsnXR1sHurc8xTNkpn2LLeUSXOH34G7bmMst8v02xjRgRVe
	x5BhmSoNOp/u8lD1RtDI0h51OmI4VJz07qc3lqCtJFX/ewfPnOHZeV73janzWkOx
	wiASxedcsjhz5kpIrUKwqCsCyFjdp/SvFq7/dKAV553eJVrN3u7NslgR+MODdryJ
	JKy5xXjfxuQky4qRXFjG811q15NT21+aOQxaWe5R+BMOhejXB5eFjsvTaP8u1ju7
	w9OSTz4zInZa/kC3/y1bw==
X-ME-Sender: <xms:PJDeZwKamvFvitc_8b5-ILgAsDhJJiMw033QL0nZjP-XvdB4NVg6YA>
    <xme:PJDeZwJ7_8KViu88SX8MC-SW6OotvS7WWjPT_6w22WJn8PungaSOp7Dx9QQbaScb8
    8yHPw6kMensShK46yM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheefjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghnughi
    rdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghvvggvnheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdgu
    vghv
X-ME-Proxy: <xmx:PJDeZwuEg6hGGEK5PHiAyO3GZtowY5eCwDah_bCuezcT5Y8pwbI5-Q>
    <xmx:PJDeZ9aGqHFd2wNx5nns2BEm6odzvnQ3MmBCHCfeEJg_Msy_RGfI6A>
    <xmx:PJDeZ3ZxcestJZdFEPmdTTneC5DR54PktFNkZZdl-FuF2zCBFrwWTw>
    <xmx:PJDeZ5Dv65gsmURvHnm_NCS9k_iSaGuGAV5cWMCRz796Qm7cCnzlQw>
    <xmx:P5DeZzqXt91aNcgVvxTn0rV8KereEgd4qWw4JYKeoXGGKsd4V-Iif9Ep>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A70FFBA006F; Sat, 22 Mar 2025 06:26:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T4cec72d9951ea634
Date: Sat, 22 Mar 2025 11:25:44 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Hector Martin" <marcan@marcan.st>
Message-Id: <3a849f4d-2cea-458a-9045-b2ae98d4293d@app.fastmail.com>
In-Reply-To: <mp77oombs4xgr6sjj44ne7muybfrwejgehzv5xupeanh6udui3@ymgfesctindh>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
 <mp77oombs4xgr6sjj44ne7muybfrwejgehzv5xupeanh6udui3@ymgfesctindh>
Subject: Re: [PATCH 2/4] i2c: pasemi: Improve error recovery
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_032611_383447_36209F60 
X-CRM114-Status: GOOD (  25.25  )
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

Hi Andi,

Thanks for the review! Will send a v2 after -rc1 is out.

On Thu, Mar 20, 2025, at 01:17, Andi Shyti wrote:
> Hi Sven,
>
> On Sat, Feb 22, 2025 at 01:38:34PM +0000, Sven Peter via B4 Relay wrote:
>> The hardware (supposedly) has a 25ms timeout for clock stretching
>> and the driver uses 100ms which should be plenty.
>
> Can we add this lines as a comment to the define you are adding?

Sure.

>
>> The error
>> reocvery itself is however lacking.
>
> ...
>
>> -static void pasemi_smb_clear(struct pasemi_smbus *smbus)
>> +static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>>  {
>>  	unsigned int status;
>> +	int timeout = TRANSFER_TIMEOUT_MS;
>>  
>>  	status = reg_read(smbus, REG_SMSTA);
>> +
>> +	/* First wait for the bus to go idle */
>> +	while ((status & (SMSTA_XIP | SMSTA_JAM)) && timeout--) {
>> +		msleep(1);
>
> Please, use usleep_range for 1 millisecond timeout.

Ack.

>
>> +		status = reg_read(smbus, REG_SMSTA);
>> +	}
>
> You could use here readx_poll_timeout() here.

Yup, that should work.

>
>> +
>> +	if (timeout < 0) {
>> +		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
>
> if it's an error, please use an error.

Ack.

>
>> +		return -EIO;
>> +	}
>> +
>> +	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
>> +	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
>> +		!(status & SMSTA_MTE))
>
> Please, fixe the alignment here.

Ok.

>
>> +		pasemi_reset(smbus);
>> +
>> +	/* Clear the flags */
>>  	reg_write(smbus, REG_SMSTA, status);
>> +
>> +	return 0;
>>  }
>>  
>>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>>  {
>> -	int timeout = 100;
>> +	int timeout = TRANSFER_TIMEOUT_MS;
>>  	unsigned int status;
>>  
>>  	if (smbus->use_irq) {
>>  		reinit_completion(&smbus->irq_completion);
>> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
>> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
>> +		/* XEN should be set when a transaction terminates, whether due to error or not */
>> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
>> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(timeout));
>
> what happens if the timeout expires?

I think that can only happen if the hardware is seriously broken because
it's always supposed to set XEN. I'll make sure to catch that case in v2
though and print a separate error message similar to how the polling case
below is taken care of right now.

>
>>  		reg_write(smbus, REG_IMASK, 0);
>>  		status = reg_read(smbus, REG_SMSTA);
>>  	} else {
>
> ...
>
>>  	struct pasemi_smbus *smbus = adapter->algo_data;
>>  	int ret, i;
>>  
>> -	pasemi_smb_clear(smbus);
>> +	if (pasemi_smb_clear(smbus))
>> +		return -EIO;
>
> Can we use
>
> 	ret = ...
> 	if (ret)
> 		return ret;
>
> This way we return whatever comes from pasemi_smb_clear().
>
>>  
>>  	ret = 0;
>
> This way we can remove this line, as well.

Sure, will do both for v2.



Thanks,


Sven


