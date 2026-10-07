Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9034BCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZDmP8DzJugW5eXodu1u8OXMJRWyqdoFMQGjudVwguv8=; b=Mrrol7wfbS0o5Kqz6wZp50mV5c
	/hbFyZO9UIFBzWpea/oubq62aymgbdetjw+VL9hzAnIPeNjs3b4DbyTSzzf1qKNhSpCZ0uqEc4Ca4
	opzhOMVHGffk+fdPa/sMJ0+L0pSQRHRtjRMh1kDdUiVr7eUSBZ/AovXJPzT5oss2iOFEMYVlV3bt4
	/jIl8d4OAw4ESOG382uCEmDRHN/raCQf0OLzYrf6RFtaIT6fUU53PIXYv2gO1MGUDUHI6NH6RNN44
	BevW+SAXjn8bDW+cGrjhkPaxf4AfzwMPT/el/J1NhXPJrjya5MMCdfDDdK3Yftv16g/Yu8eQd7Bww
	2TueHw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZIb-00000003CK6-07Ux;
	Wed, 07 Oct 2026 21:35:41 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZIX-00000003CJU-3jtc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 21:35:39 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6EDE114001C2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 17:35:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 07 Oct 2026 17:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1791408931; x=1791495331; bh=ZD
	mP8DzJugW5eXodu1u8OXMJRWyqdoFMQGjudVwguv8=; b=cYGPI9KXhbCE7Gkvq/
	66lWCmysX/OO1Dxffzb1WkQY7v4WBxsjqsWkZZ9Het6tbxTXPOLVCGZ+obzrl4oD
	MHHNloaxh1LIQsyqZqoCUQw071jyIPUbaNTMsXoouoh2wdFw8WuXfLU/UExHydwa
	cyPPCvnNb2yO9lBTdwqCFVg3FLO6ET4LScLvjqCH7B/EGHSYPgvLSChAXYKHV8na
	kC51lZJlmqsXUmMEkfSGtsBHP3GaO83cPa/O3RHDqezMyFgKoyquGifL7jTHgmO7
	8hJqVVVm7gzyzz6AKipr9jdnTc/lBG2juYXOVJLkC8Je5+XvNVYkz0bzB+ma2Ec0
	2kLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791408931; x=1791495331; bh=ZDmP8DzJugW5eXodu1u8OXMJRWyq
	doFMQGjudVwguv8=; b=Ar7EGNaQ3EB5n6LvjSl+UzryVQNL34Mb+451oHWaNvnj
	pj9ai0fQiNexlFrku+uPcF7P/4c9lpo2Eh42F9upvFWlQ9THfbgVKK7csgyN5fsz
	VpiVYepWXXi6wkuUlmPLwqpjXeVweqcPEppvlNiEuMlhe0e3ehdNGTDhcw6xqD7I
	lNxlEF1S5CCcuudfPq5sCQ2gqhzi1dkWizCzYO6KtYnL+XzCm04gafAX2OfSQlSb
	Q3bf0apv3CAzaol1hZo97ybUqTFUaw/uzpTMoOfRueMAi9MHajgsVTGRC8AOkkpN
	F2onZY9HhSi8yNCaQyzSAeMwLh1aIzZFYYKxot1Qrw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791408931; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:csiWGi9kdMorVYXWqUKA8TItCcMfLi8v2GB3UhdBvvbij8a
	G/egRQAZDg16s45qHhoVt5lUTSwbaG1HfKdmr1/2zohkzYvB9FXqzEetjGzyCXMj
	89bA9X/Gbetd1r1ziXbS7EyuYzQLFD+68IKgmpkZweb3pLiKar+sM7Fi7AsPqDn+
	V17AP1985fDW5YxwHSOIquA57dHkV4Rbz5uqnw6I4KKoDInxOR9f+LWKouc4NiJu
	TMZopopXInLbxM0MCT42aYH1LGK37vQM5uJmn69RFl4TfONHqeRHJbQiL/8EW0wb
	3FJboAM4BA36eJGDxTAE5d4QJNy4iSohz9uQYZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:9RIeI19IAZDvn4hm6qyw4aDeAN8s4u31KcNaWRkoBkg=:wYsP8cX//0rpRYNJSb27S+esVIVihSU1dWHck+ptWIo=;
X-ME-Sender: <xms:H7vGanqXgeKDC-yyKpM9Lb0kaZeiabSnFA77ekRRMGHkP0DJmaqXLg>
    <xme:H7vGasfuSytRjJyhjFAPXNRQLGeo7D2LojqkZ9SY_D1WgjQlqGzeIeGeapOFVrEDF
    0ugmkWE4mfOs79MJWQErQ8GUX8AfRHJjJoAyuOJUhS5yZ335nzDTNRN>
X-ME-Proxy-Cause: dmFkZTFVcA5N6AxELDaRr8i1HexnWBvhEKMQ8baou8io56McBPAWDv3xqkYXj3kGTbmuYL
    abVyTMMQ+JaZ4BqO1IawdKTUOBer4puvT/Ez2gwB/YaHWyV/1cTGGp1oL77ie6EmEb3bS8
    fGZUaoX2wr5S8w4Lk0Ag798zK9TJs81OWrvQt60zxbPxGNjYOjzpTVB3V1ctA5NbaWmt+d
    UIL4+Hl2pjJuTFX48+fDuKFWML9A+ecabJuy0w9nmFSbsajuzZM/9Bp65fR1QOJK1iSapP
    5JyItNqqHF7BVKfrlS5OzHN+dM5zzOEFVAZWmbRUKgtR/FmleMx0ltvPzg507omKuzKYcm
    YdKn5j7FqGudB9Rnm7P5BJeYkzLXI5b5PEZ30kHdrCbheI9v1XkABHrXI8lgjzxF1XJalI
    Isp04p7KZgryNfYJIUars4v1hQFkwnuSjgGq8nfaw+xzdkNHJSoPdD925RjikrIleSvbM3
    b2oXGmaVTm5DmwbrlBuXIPj+s2gwZNreckKap9R6PeEUViNp0ADpiW4vRhOSFUhXPT1p65
    spztcfHiVGvclW6t40BxxauRkFJdBIRnoZWDPzLIGG2AQSuYRfIfUDGsaywoMnyXFKRp0C
    znVsHmJbJe2cb60YiX6KxiNJD+CeZIbq+KFzNZTf8stM9G1HXiObIAKmWJCw
X-ME-Proxy: <xmx:IbvGauMjFMIvm0MMfEJDhYjPqdKBYnxFcIZAlvXqRW4SQJz1KyO_lg>
    <xmx:IbvGavM946inu2M7ORC4dNsJywJrLCS8E9lg-_GzpheZtEfbi4rJ0A>
    <xmx:IbvGaniOsdMgDc3J-XY2gulvD49jndj5t9p9Non0dJNl3ARRpSzGzw>
    <xmx:IbvGakvn6J2fzA1mnD8zmxZAg-UU26DWQocJuSNRzJSFq7wpX2BZ7w>
    <xmx:I7vGamjkn4UU_g94cyHX8FYcePZaBgWhF8hIwmjlrGVTA5-rbEkNBYHj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BDE8332A008E; Wed,  7 Oct 2026 17:35:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AamXen0t4ZPg
Date: Wed, 07 Oct 2026 23:35:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Stephen Boyd" <sboyd@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
Message-Id: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_143538_354293_604669A3 
X-CRM114-Status: GOOD (  11.99  )
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

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-2

for you to fetch changes up to 1fc2d80928b706147e371602dabd0ba927dfe4a3:

  Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes (2026-10-03 23:33:02 +0200)

----------------------------------------------------------------
soc: fixes for 7.3, part 2

There are fixes in three ares this time:

 - Four distinct issues in TEE firmware, all fairly minor

 - Five devicetree mistakes on NXP i.MX8, lx2160a and Qualcomm
   based machines, one of these may cause file system corruption
   from an incorrect SD card supply voltage

 - Five fixes for clk drivers on new Qualcomm platforms,
   addressing issues with incorrect enable states

----------------------------------------------------------------

Note that the clk driver fixes should have gone through the
clk subsystem tree, we had some miscommunication that led
to me picking them up here but decided to leave them in here
to avoid extra work for everyone while we're at lpc.


Arnd Bergmann (6):
      Merge tag 'qcom-clk-fixes-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'imx-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'optee-fixes-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'qcomtee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes

Babanpreet Singh (1):
      tee: qcomtee: fix kernel-doc warnings

Dale Whinham (1):
      arm64: dts: qcom: x1-denali: Fix microphone distortion

Georgiy Osokin (1):
      tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()

Imre Kaloz (1):
      MAINTAINERS: update my email address

Luca Weiss (3):
      clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks

Mahantesh Salimath (1):
      tee: optee: ffa: support shared memory offsets on large-page kernels

Shao-Fu Chen (1):
      optee: register TEE devices only once fully initialized

Stefano Radaelli (1):
      arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply

Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

Vincent Jardin (3):
      arm64: dts: lx2160a: fix incorrect pinmux
      arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
      arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value

 .mailmap                                           |  1 +
 MAINTAINERS                                        |  2 +-
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      | 19 +++++++----
 .../boot/dts/freescale/imx8mp-var-dart-sonata.dts  |  1 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  4 +--
 drivers/clk/qcom/gcc-eliza.c                       |  6 ++--
 drivers/clk/qcom/gcc-hawi.c                        |  6 ++--
 drivers/clk/qcom/gcc-kaanapali.c                   |  6 ++--
 drivers/clk/qcom/gpucc-glymur.c                    |  2 +-
 drivers/clk/qcom/gpucc-kaanapali.c                 |  2 +-
 drivers/tee/optee/ffa_abi.c                        | 38 +++++++++++++++-------
 drivers/tee/optee/optee_msg.h                      |  4 +--
 drivers/tee/optee/smc_abi.c                        | 17 +++++-----
 drivers/tee/qcomtee/async.c                        |  4 +--
 drivers/tee/qcomtee/qcomtee_msg.h                  |  2 +-
 drivers/tee/qcomtee/qcomtee_object.h               |  1 +
 drivers/tee/tee_shm.c                              |  4 +++
 17 files changed, 76 insertions(+), 43 deletions(-)

