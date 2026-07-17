Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A38C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 02:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgJlTQnbgsLz6gWZ8OpMErGqYTlQX85MRhWR8w3pLFA=; b=2TmriEeYXzj4rONHLeroX1zVVB
	GAlfENxP/HQzUjBT4xrXglFWuOeHSDovi+gubPaNuaGsJZmWPGAXXfYXfe5tNLCOlLp1E7l96FXGF
	889N1Ml7MMpaQHyA51uTQ6ZmNYXHVNFS1UQ0c2vD9p115FNnUTOS+kIc0K32NTV9ida/lOU38AgNj
	8742mWfxa8LY2AKFXVeNeHxpvyFhiQCp+deAdmA90wo9G4SNmlkCZUWOE60gewWPBBVqKjg5YRabt
	zyKaW2dUoJJp/LnrS0vmrpO+ZLcVWV81J3a8l4KAtBDIZOxK7Vy4Wp8i2fYjU7N4Cj25AqHSmEv6F
	jKgEXndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYF4-00000000xuN-2zr8;
	Fri, 17 Jul 2026 02:23:58 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYF1-00000000xqx-26Av;
	Fri, 17 Jul 2026 02:23:58 +0000
X-QQ-mid: tivesync5t1784254972te2512413
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.200.247.46])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 7710639420010106097
To: "'Coia Prant'" <coiaprant@gmail.com>,
	"'Andrew Lunn'" <andrew@lunn.ch>
Cc: <kuba@kernel.org>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<pabeni@redhat.com>,
	<andrew+netdev@lunn.ch>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<heiko@sntech.de>,
	<netdev@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>,
	"'Mengyuan Lou'" <mengyuanlou@net-swift.com>
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com> <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch> <CALj3r0jdkDEjpO+7NOTGs+wgukKvD=fzFn4ewpurxxPswCE5GA@mail.gmail.com>
In-Reply-To: <CALj3r0jdkDEjpO+7NOTGs+wgukKvD=fzFn4ewpurxxPswCE5GA@mail.gmail.com>
Subject: RE: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling for Rockchip RK3568
Date: Fri, 17 Jul 2026 10:22:51 +0800
Message-ID: <000c01dd1593$2ac0b0f0$804212d0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQLtuIytmYACIt0zp727MFXQnXwl3AG2MkWBAlDURYICTkKn3bQdANsw
X-QQ-SENDSIZE: 520
Feedback-ID: tivesync:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NybvHh8+lS4LpWUIxKfwhaXMkirlaSY72wb1vohcRKO/gEOGQ3XvVM65
	f4TRnE3zowaQw7Zju4BbDiNyrQxrNxZ6vbZi+95VbEjCzyXZUwyhyLk6M7V4qBDyHgGCpTi
	ly5xhIfrvjq0CzbVUSdJWwE7/11XTbDmXB8YXfJez8Da/VdHh0Mt0sLR6d6M8t71m0k7Ly2
	c6uLyNvKUUJ4LpNC+fA4jZ4vmpX9Mwvk0ucc5Tin7ROL43vH37Z1V05ceguE6XBFhSJyEyA
	CWKBOE3pvNnWQne5SQzoEELrZFisgmF45J4MfcrFCIJyWtieiVmnzn3R+lOT6iaedAigc/o
	B1V0NR3TBQ5erBVvjD/LQUeTuiE6v1c3YQGhaV8hWeDLLl1Ez4C436xiPQGx3OGMeXM2OPB
	LQSjBuct7IVAuCekCEJl8krsYJk4LqZuKRTMEo7Qrmj5aYFbJJllhbG84auJUtLnLGzicsF
	Y0d7E/bdyIvxkgSwtPzUZTxWCVfwACXHVHwiEm2qRBKw2bSjyawsdDzPGGPHBud+v54n3iz
	N6GzMXBFJMpl+dqZn3+LHQzBJhcT6VAa+8sxjQa5r3sLtJ2bSR3pNBXb4pXzwRYHmQ3vX6E
	OAdBEnLzhl8G7bDURTWQKYVLoSa+rSVBbUQrIBX4dXoUZgjjYs8hTVr1iLVXfZqlzw/WOSO
	IBJlvh3Zn3ezzvINNFbuux203pp2tlBKpjR16LyP2oTOreZmnJZ3hhqQgNCy/hBJpMsRKpu
	KsKjlL59TQaGH1fZANJoYrzxX7VqD7eb70lLcGbFGsvFaToDzF12l3dPv3005D3mW5i4lbx
	rYCXDkmWEgv49W10C6QPn+MuY218xil71ZtrGPXq84dmixYzXyPNqBMK8PO6yiERhxMwjqy
	zFt3HLdvpeC/3p/I+ZqHk8PT04zcUnyWFfaMIuU/suGotEdOAqApeFWcnWqNNjuQJqjoze2
	WhSfO16ixE3Lx0RE8Pf5lXS3A1cQ8Cu4F10e0YyGltfdr40A6lLejMQYPnESZxAApRkKNj4
	ZH6LsF2qZdeQIzaToRs+5GIrPxUBbJkucgCq7TRkgek8TYZx8ZvlBWsPZADUeS1vH+oi70Z
	GvhKFQmay5d
X-QQ-XMRINFO: NS+P29fieYNwirDTQXjMQiTguMiDOrnzaw==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_192355_928494_1F4C5B77 
X-CRM114-Status: GOOD (  27.05  )
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

On Wed, Jul 15, 2026 7:05 AM, Coia Prant wrote:
> Andrew Lunn <andrew@lunn.ch> =
=E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 =
06:44=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Jul 15, 2026 at 03:08:34AM +0800, Coia Prant wrote:
> > > Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
> >
> > You do not appear to Cc: the Wangxun NIC people. It would be good to
> > have there comments on this change.
>=20
> I apologize; the output from get_maintainer.pl is very long. =
I=E2=80=99ve
> heard that having too many recipients can cause the PATCH to be
> rejected by the LKML mail server.
>=20
> I have added Wangxun maintainer (Jiawen Wu <jiawenwu@trustnetic.com>
> and Mengyuan Lou <mengyuanlou@net-swift.com>) to the CC list.
>=20
> > > Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
> > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> >
> > Please don't mix fixed and new code. Is this a real fix? Should it =
be
> > back ported to stable?
>=20
> I am not sure if this is a specific characteristic of Wangxun NICs, as
> I do not have any available for testing.
>=20
> The behavior of the Rockchip DW XPCS IP core matches what is described
> in the commit message (even though phylink brings the link to down
> based on the phydev link status).
>=20
> This appears to be a bug (at least on Rockchip platforms) or Wangxun
> NICs features.
>=20
> However, I cannot confirm whether Wangxun NICs behave the same way.
> Therefore, I have kept their code as is for now.
>=20
> Could a Wangxun NICs maintainer provide some feedback based on =
testing?
>=20
> If we can confirm that this is indeed a bug, I can submit a separate =
fix.
>=20
> I would greatly appreciate it.
>=20
> Thanks.

Hi Coia,

I have tested this patch and it works on Wangxun NICs, thanks.

The commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
is too long ago for me to recall exactly what that thought was.

The log shows:

"On this device, CL37_ANSGM_STS (bit[4:1] of VR_MII_AN_INTR_STS) =
indicates
the status received from remote link during the auto-negotiation, and
self-clear after the auto-negotiation is complete.
Meanwhile, CL37_ANCMPLT_INTR will be set to 1, to indicate CL37 AN is
complete. So add another way to get the state for CL37 SGMII."

I tried to reproduce this issue, but it didn't seem to exist.
In the current logic:

link up -> read status from CL37_ANSGM_STS -> CL37_ANCMPLT_INTR not =
clear
link down -> read status from BMCR -> CL37_ANCMPLT_INTR clear

It also works, although CL37_ANCMPLT_INTR is not cleared every time, and =
AN
restart is absent. But BMCR looks like it only wants to be return as 0, =
it is
weird.

So I think Wangxun NICs also can be applied to general code as well, for
getting state in C37 SGMII mode.

However, I am wondering whether CL37_ANCMPLT_INTR clear and ANRESTART =
are
necessary.



