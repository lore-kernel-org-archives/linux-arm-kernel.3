Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF13C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR3LESeh5qWqE1nsMsX6OvvYNBnjmcXgWQfYW0WVmZc=; b=EdmmXlLjPSdYpQY6Z/z2XitfnF
	p5tD/8QkCfLhjO+TMNZ/EzwrVCht9/Cn5b3q24o4as37I8pRyYI3EtfgPkWIuigxnS7r3Xiw5+YbX
	Zmi5PYuldeebjEj0un6tDCUPSMmgudI2vOcFHEl9Cn1rv5/QQ5nMCa1xrcmZ5ARPtGQQcuIX4cgg7
	79p3c7AdjzkaHBg6CHNPE9ttFOJ2ZBgF8tgRsd6H7fwbOwwbhwlJ4/pH6zJWgzI9C23hc9G7J5fYK
	dAzcq+/iHprfXPPATqFksgOI/7NSYSJmnSonMgNa0KlDCmk+P+0nL8iav6eEkkeeBE4RCapLzjNTn
	0R2wKecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G5-00000004SPy-1T2K;
	Mon, 17 Feb 2025 12:29:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzXj-00000004M73-3J93
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BR3LESeh5qWqE1nsMsX6OvvYNBnjmcXgWQfYW0WVmZc=;
	t=1739792647; x=1741002247; b=k5zckOQ501krUQ9xv8QTG/U7k0H+FgmcL/+NFVhTd6SLXIJ
	is6qO0oVeSucxxrhcISxOAFUTvHQnsK9qpO47FPTcjP6wstWwzblNJb+iOPobTIeXarl1qLdqqzY4
	v91jEoJRDx/2PsrNrTKA0VRdx0M3R9mNlaG+D0a4bo/XZV1npDXhmsrAk6cDTmDsyMvoDzJkYa/8s
	gj7TkQaQFm+9geWyHXeu6zYvkxkhE0CvWcFJJR/miIQk/eShFR8Zyyy81jLKqrFobh6oysOWEB5HJ
	BOe0QbED0U9YMKS316GXI0+KtOyygc4+G15c7DNhlC5UIWgu3hTCNl16hCgyNIeg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tjzXZ-00000000JSW-1v57;
	Mon, 17 Feb 2025 12:43:57 +0100
Message-ID: <673d0ef9477f1dfbed474cc51ad68092814dfe85.camel@sipsolutions.net>
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
From: Johannes Berg <johannes@sipsolutions.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 	linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, 	dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, 	gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, 	john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Date: Mon, 17 Feb 2025 12:43:56 +0100
In-Reply-To: <885a9312-484a-4b60-bec0-5adf8f1e4a0e@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
	 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
	 <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
	 <59333d4aa8a3bb3222967d70d10d9288cece444c.camel@sipsolutions.net>
	 <885a9312-484a-4b60-bec0-5adf8f1e4a0e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_034407_824003_68068781 
X-CRM114-Status: GOOD (  16.98  )
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

On Mon, 2025-02-17 at 13:39 +0200, Eugen Hristev wrote:
>=20
> On 2/17/25 13:19, Johannes Berg wrote:
> > On Mon, 2025-02-17 at 12:44 +0200, Eugen Hristev wrote:
> > >=20
> > > At this moment going through devcoredump is not something that impact=
s
> > > the idea of the implementation.
> >=20
> > Yeah. I don't think it _should_ go through it at all.
> >=20
> > > The whole reason of going through it (because things work without it =
as
> > > well), is to see whether this has any kind of impact or not, and if
> > > there is any kind of fit/reason of going through it.
> >=20
> > So it's just a trial balloon?
>=20
> Yes, that's why it's marked as an RFC.
>=20

(IMHO) that doesn't make it acceptable to just randomly go modify code
you don't understand the purpose of, certainly not without actually
stating such. But anyway, I'll leave it at that.

johannes

