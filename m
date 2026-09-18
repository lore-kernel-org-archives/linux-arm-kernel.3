Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E415C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0DMlHDuV2LFIDoZEFEovDOSN4mbDMuTeZ8dyf8LL5E=; b=V2t64y/DytVgxFRDFX8qX66Aei
	GWmu8Fc+9ArKSNDSzq8FLdIfSuWXtv3/Y2GRCNAIDRiUKHwz/eBS2b+TTaxjJDgClpqPbdjo4QzRO
	TEhEKm93ldMV7FAp3VN9Nh4JSctkzDb8LQ+M0BkdiYwiSAN/8RbJbsDWxNMS/DY7XE1/mt/D5o8Ec
	KNJLdwf8kqtcbt0WvhM7hn6LO06oQyQStBpJ/p5Vbg260AkWZDqUk+Op1IgyQh/oQ3eft25va0C7n
	5FRLSPB1mARXSoYasNSx1WLjGK6NkB0tIMrHmEYPkuVa3537PSMKxrQbbhnibR2SZ4YCXJglOW3Pt
	MteSiiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SWc-0000000DclE-1MFk;
	Fri, 18 Sep 2026 06:56:46 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SWZ-0000000Dckf-1iwt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:56:44 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id E59B21D000D1;
	Fri, 18 Sep 2026 02:56:40 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 02:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789714600;
	 x=1789801000; bh=r0DMlHDuV2LFIDoZEFEovDOSN4mbDMuTeZ8dyf8LL5E=; b=
	IIQG6gVlwyxnfndRAOQF8DPr3eBvygmerR9HX3Oji7Q7NGUw4Dt0JtZRHMbRnta0
	V80YTxJisJyPw0B0KeLvc8fhYZ9decGe62XP5QNmcbqttuv8TtFG79IfU0aemYi4
	uiEuZZb1ozW0tBn3HorBYNYyJirlSe0YEIiOGm4WtPsWxMBcic3I8MBEaVwUIB53
	O6yqA+aBYMve0jUXckC/vuLQMCnPXPDyyABB/sKT/GmER1hez66cimoKbVQ+zXiO
	RXXVnnQcdqd1pbI1j1q9K7g4rweyfHXnq+FRmpVMlWAAWv9MwE9VVaHLfTD5J2jY
	+6qu/hzvAezLr/4ZD5xFZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789714600; x=
	1789801000; bh=r0DMlHDuV2LFIDoZEFEovDOSN4mbDMuTeZ8dyf8LL5E=; b=A
	un6ov5AyafMFDReHcxlqnbIvzm5Y30awBH8QlPD3wG5JnjypDCimPS/USVE3wq3q
	YJWDInr8ToPbJTpXlrl+9Od+A0AlTYNFMqsS/3tlqdxd9zYVgwnzkr8UYFI9fTMH
	DpT05u3F8wMtFqK+GOFph+r2xvR8/fErHwFvCy0EWpWUrtTYGEacY3NQPmMYHDkx
	WkpppmNtRU5aliQ8Op2iXvONOYwkwQXXsQOVrluwrs/DvNDvVG2pbpEoGfNRoI6z
	mXPTgp1q7tAivKcgOsSWGHgqJgNiK8Urg7pJ0zgCAYxNonLZcgLI0d19+Bly+RsZ
	bpdvxUvUUNyk2+eotnEkA==
X-ME-Sender: <xms:o-CsajFMjXBHK0crUge2XUaK2TNXE-RUYAlBczbg3g3ZCPsFg3GBeQ>
    <xme:o-CsarJKWHWLG0uRXtna6zQxxl86JsbkYVoqbljcwJd46nj2cG2OkJyMmyAT6CHMt
    hTlIoBOQD1e7PFj2I_YQzuILUybBJ75pDmeQGylXXiT4KQLbPW0eY9o>
X-ME-Proxy-Cause: dmFkZTE51d9azPAy3ibgXqxIXNxqm9lJw06wJQTHmRm8LbSiKF8Xd7g8qBGhORcyEHzQ/1
    0DlqsN+aXKv5vz1vSZ7AZAg5II1V2VVdx9CydhKGL0xtVYzUmWP7ID29eUPxi8x+1smOpa
    rKrSvlCwSQyRFZXYCQlObz7bsCd3B03+ZYsA1IK5u4M7TzcL4La1jMvSsDiLl4WWVU5Rdm
    Xyc9Yv33Wmp84TQcyYjsModn+ZUEs6WCXbyOI3q3qcWLIKXQ4QUortHdB4OQF8Xj3BpZBe
    6WwBIG5S4vWLPoHQ/AKujLQeE3W48W9bxCEuIu6XBoB+YUYgTmwV7XqCjooXciDC4E3ip1
    sc36EVWpP5l38nvEnQO23IZLUnaCD6L+jkg51GP9h4lyS4a7+LB2VhN20oe1jDGhLwthpF
    11TxFT6LnC5znRnCc5mzQKHnJIjWlL1lwjWdUfSkn/VMwTFAkkYzim06996E60GjghK3Z6
    QR+QaMsxDSrTftli7qiYJlCDdUz00v05LlqpXI8JYuUuchjhNFX9A/8s4O/MGFea5ihmXi
    02SUuppX9nV+9clOVZXtgSUCbuSyh/sBW5OOhhtk1/rlLeEngR9BYvzHJHKz/5tiOTSMyn
    I+TlWyxAqJW+3RklCko3m4md0A54Bl0rpnRYScEsTLFTHDfgm7FCJAPdc/oQ
X-ME-Proxy: <xmx:peCsajoasIFWDIfYN0Z5BvnoiRwLeQ1SsVNAe20SYsPe0fPLfT4_mg>
    <xmx:peCsauG5rRzL-MrGt2xYGh4WUsBai_iocFMRwsfTraB7qUaQyOdG8A>
    <xmx:peCsav-6RyWXfDW6GLs8yHTNJWI083jbsHWVsj-g-p5SqEvjOHQaBQ>
    <xmx:peCsajSIMS0v_VPXpFQi9IMbYJ_8IakqvpeCSO5eNOFC7S34_WNpeA>
    <xmx:qOCsapSQj-4EJquIFoeo8pK6xMvtP3o2VkG57_DRjjxLl4vQ4ZJiqObj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1D2CC32A0084; Fri, 18 Sep 2026 02:56:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AytAa-GFwSww
Date: Fri, 18 Sep 2026 08:56:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <6e91a8c6-c078-4b42-92b6-9902e6d0d270@app.fastmail.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-9-f4cd8f8e3265@igalia.com>
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
 <20260917-tonyk-syscall_table-v7-9-f4cd8f8e3265@igalia.com>
Subject: Re: [PATCH v7 09/13] mips: Use the common syscall table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_235643_803129_E566CB03 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, Sep 18, 2026, at 01:46, Andr=C3=A9 Almeida wrote:

> +
> +src_n32 :=3D $(src)/syscall_n.tbl
> +src_n64 :=3D $(src)/syscall_n.tbl
> +src_o32 :=3D $(src)/syscall_o32.tbl
> +
> +.SECONDEXPANSION:
> +
> +$(uapi)/unistd_%.h: $(systbl_common) $$(src_$$*) $(syshdr) FORCE
> +	$(call if_changed,syshdr)
> +
> +$(kapi)/unistd_nr_%.h: $(systbl_common) $$(src_$$*) $(sysnr) FORCE
>  	$(call if_changed,sysnr)
>=20
> -$(kapi)/syscall_table_%.h: $(src)/syscall_%.tbl $(systbl) FORCE
> +$(kapi)/syscall_table_%.h: $(systbl) $(systbl_common) $$(src_$$*) FOR=
CE
>  	$(call if_changed,systbl)

I can see how this will work, but I'm not sure we want to keep
maintaining it like this, if anybody wanting to use the syscall
table input files now has to use and understand .SECONDEXPANSION.

For instance, we will already have to duplicate this for the
./tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
directory in the kernel, but I assume that others already have
something like this in userspace.

I really liked the idea of combining the n32/n64 tables into one
file, but the added complexity of using two input files for three
ABIs here makes this much less appealing. The easiest way would
be to give up here and revert back to three input files.

A possible alternative may be to go all the way and only have
one syscall.tbl file per architecture to simplify the scripts,
and then combine mips o32/n32/n64 into one file and do the
same thing for arm oabi/eabi/aarch64 and x86 i386/x86-64/x32.

      Arnd

