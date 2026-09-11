Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A10C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76W/T3cm12M72x4+3eNdXCRYKQDmGkS57clCXK/ieLc=; b=3XIsv/oj7PAVdjQvj1WpLm6CdX
	XMSDfIeaBsVg2aIj85Dr9dUrPyZdFpmLp3WXCF860XUUWfzxAQzKeH8QoUfBg5uiG1CHe6JE32IJP
	P8UrHce/sLv2YEhKQqjmDzXT43GmmpeIpLWcymGTf8Lv+BG3SFboh4E5H6FpFNM+pFpTE+AKnVF/M
	an1QS/ZKfU2u2kFEYoJQIPy8hLOH5AyU8Ta9TlnX2kNVhpgsPAZC/39sbOwIMYOpJKPPq6iOj0tgE
	OkyHDdqHZQ5S/lE5RrcpfUQ2UBrBkxD6NcMLyVxX76jRVyoTKUHHjVE5Asq+fpCVUoUKiS0AkA6BI
	IboimgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53UY-0000000H8E4-1zwH;
	Fri, 11 Sep 2026 15:48:42 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53UU-0000000H8Ca-1U0j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:48:41 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 69D9EEC040D;
	Fri, 11 Sep 2026 11:48:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 11 Sep 2026 11:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789141712;
	 x=1789228112; bh=76W/T3cm12M72x4+3eNdXCRYKQDmGkS57clCXK/ieLc=; b=
	VMzcAXDT9CmBgrfBGifhN6+CXzsT4Df+y18RkLKk478yGxDy/2Kc+d9HZm6rHF6Z
	sGhiLFD8XA2q8n8VfAG4bz86TDSk0HIVliPGsmlQdaqWKOon/4u2aixOuGHFj0rh
	mOchaTjYfKWXxFtqBgZb2PRHA/8fl/nRHyz2AW8ieNr2p4TSutt79Zm5RqyjB8Jt
	pjobLhzMYaH+yJw/eyRmE+hpJPjjDjuX+RO5kW520cJt+U2y1e1VQwhswyhF7FiW
	ngN/zqt35iIQZfRIdnpMwoQkYkrC2O0TqTQzyMr934bNh7MP4mcDxTEJQSK7boj0
	ER1lrnhBvMzu5wk7wxe+cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789141712; x=
	1789228112; bh=76W/T3cm12M72x4+3eNdXCRYKQDmGkS57clCXK/ieLc=; b=H
	RzxEQsDthogzduY1fHIgb4Wg/ZNJQEn/dc6Pttymrh+mPh6UQUm2vS46y5FfOihF
	p7xcrJ1JS0AA9f4TlevCxLFWSqNKnEEQMCu/3kO8mz5k+fwYFIcPkboKpSdK74SF
	R/PmjPqJVDbrBMW/rkU7LBUPDsPozfHvZahIIL3Qfo0Q6C9yr6lq/TxrQuYKso5N
	3JvzwHC1mByTXtUCG+r6JC2Sz06nLJSDi5m4397V2A1uuWPmU3Ol5RvPzSBOAjVH
	t3ZyEoTvCqh2gz0r2Gz1uKywGb+cI3NQVTqOoaGMCIhmoI8REgmzLtRuHjPz/2HX
	MZq6UDZ2tVXG2xoT+Xbbg==
X-ME-Sender: <xms:zSKkalbDEypcrtgJ9puzjj8UO9Fu3SX7aXySWmtLnd7X-5yYrlNEsw>
    <xme:zSKkanNDwC7lABVvvcSl7HcODqci-_EnNRf3MboG0PmOq-21jPE-Tzz7iTUuc3OVK
    -vBXPU577XFT9Q_KNrqvnDEfQLXFm6ZUdlks5RI-3bIXjZIpExW6Zq3eQ>
X-ME-Proxy-Cause: dmFkZTFNUhvwxGXllS8qM4l9WodmQ60N5h4Kockcar850J98qt2UmqCZ4cj1e+ETKkVpxl
    JRG0Uhn3brp8olA3lrsdvO8WRwVUIAtpIPqlYwv+5c/V4fHlqOO7rtZE4qXvZkQUBVU4l0
    Mj9Wgo/JiQUDBycQJXUe6JbgDaWk0mxiWpVxTJpx51PGqJVK3EMyOFl55XKJtJxCLkjpt3
    Utyyd1AaiVQcaCqgPnqJ0SdC1Py+u/jKnf4yfcm+N7ukKt/YXoinSvp9q+7WEWMjcgXITT
    dVZETxdqiM8H9mKDS8yRfvCMg/OhkRXF56Awht5whZmFVd979XoBymQ+MZVtHBQev3hBWW
    vIJ0Ju2lf4A7QHTmj1QfUNVC7ElmFBQrE8nboF+Yldksfzq8ItmaS3LxwN04Cd4nAHGMJt
    Y+qI+6iDgZe289k/wb52NTYWPjvy5a06Gbz+mv/eLNNFv0FrQQgc6zbEUoRKWLERQITGCQ
    o23oNGJMB0VRMZMof3q7iaOe/LBWpM9FZ0fT5lcIljOsP5G+md1iEx0xRBFSHx38vA14Y5
    S7liOqW0eRmZ9B+8wO0zhO8zK7aJREQ7467TnzPzr0ldAMCjUL3GbiMOQIKhchJ0vYxAF3
    BvnScxC/DX1fiDZCkPT/qJKRthedbWJ1tFdx/BX2MePv5NCf7YqSw3LnVyjQ
X-ME-Proxy: <xmx:zyKkav8GNompK4RaWiFRRf4TXTrNWeR2225YurULlRqSJmuo1SBlXQ>
    <xmx:zyKkat8YLIrsk6Ko5oA9N-qE5VYqS5cVHkVuAoRb8CXWVr33ZiLSww>
    <xmx:zyKkavTM9q1JeP0DjU4dRmtA_VWo_llpAgxRFMRpWRHHEZ8-1iu7FQ>
    <xmx:zyKkahfq1-XdNZs-eVWzBT-ok_5pjaB43464pAkEixL76JcchNn0MA>
    <xmx:0CKkaoehfv5ni_KL1fKbVTDHRWbo_pT4UG_a9VRN6A-AI2obOEGOXvEV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BDCC232A007E; Fri, 11 Sep 2026 11:48:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aj3OoT1esCJR
Date: Fri, 11 Sep 2026 17:48:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Message-Id: <2e3cd096-f39f-4545-8558-a6ce9cae8b04@app.fastmail.com>
In-Reply-To: <202609111050.oiut4oST-lkp@intel.com>
References: <202609111050.oiut4oST-lkp@intel.com>
Subject: Re: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121 ads7828_probe()
 warn: if statement not indented
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084838_837470_A606D8D2 
X-CRM114-Status: UNSURE (   7.87  )
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

On Fri, Sep 11, 2026, at 14:23, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> board-remove-7.3
> head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
> commit: 4df92b98525f08e1eab92a25f5da2045c78403e8 [182/295] hwmon: 
> asd7828: remove pdata based probing
> config: arm-randconfig-r071-20260911 
> (https://download.01.org/0day-ci/archive/20260911/202609111050.oiut4oST-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 
> 6009708b4367171ccdbf4b5905cb6a803753fe18)
> smatch: v0.5.0-9187-g5189e3fb
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202609111050.oiut4oST-lkp@intel.com/

Fixed now, thanks for the report!

     Arnd

