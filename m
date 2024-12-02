Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101EFD4978E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 00:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n75aHaH9r50/z426Xn4UdHXO+L597G/nx8ZpnuP9Clc=; b=H75oXLePp1kbCXDE3e/0C82uro
	ybtRbsWU6BgJkDax842g5QbQMco4t0YnLTG5nI04r0bLdaFT0thsinMjKIgxnHpURcGMzGxboGbhp
	S0YgLJlwf2ZAlQqnHXjwdX+egXhUEjT84TnYvtdnv0KcnFkn0uQVtghISeAjoSBeirY2L/WTGsMS3
	XPH+vIr+BN5ciDh4BmdQVvvXZcOsFATbqoYvnJhhiYN1m5ebJgiEzX4ZvB4ZUheWBHfoSHWE8MPNV
	m+gjoSXarWbNwPgluvVsorKjTeVm3pZrXp9xf8jZIVeWmlj4OaHnhAq8fVuWtTOY76K7BIe1Efy2f
	BRHqn0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHu9I-00000004aYR-1opB;
	Mon, 02 Dec 2024 00:18:48 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHu7M-00000004aMD-0moH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 00:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733098599; x=1733703399; i=wahrenst@gmx.net;
	bh=n75aHaH9r50/z426Xn4UdHXO+L597G/nx8ZpnuP9Clc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KieCDNdifQVxnC/ANSu4yVq5pyYCnufB0LHsFmKV0Zu6/aA01HztPYtz4gXU9Kl3
	 k2lwq3Xqtt+l6HwtP9bw0n64SM/4NjqiFH72zQ88fzPPPr3riGbFyIBrDrgeStFdf
	 bRrkEAEhA5B7LugFNDep1lWsZqvVSEB+ACXAS5J1QU8W6863iZPZgUEFw0zV1/B4p
	 Ev4k1YzCRv6jOsbNWJZTODVdKNaX5P7tYxAervO2ktvXEZM38Io4JDNXGexit4bU0
	 /22zro7XCDHtbWpOoXvr2s3D7c7aK49du+07ugNu6OI1BCJfcR7LQUUOwRQZ+il59
	 jzZ8cWftiHkltItbyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLi8g-1t0Ehq3rV2-00Ra4s; Mon, 02
 Dec 2024 01:16:39 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Douglas Anderson <dianders@chromium.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/3] usb: dwc2: Fix HCD resume
Date: Mon,  2 Dec 2024 01:16:29 +0100
Message-Id: <20241202001631.75473-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202001631.75473-1-wahrenst@gmx.net>
References: <20241202001631.75473-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZkVGzKnFko6cy1Y8yUffnI2n3TkRqSDIHZFuoyVKXiKQKlXM0jt
 ionY+yjTepRx+oV3cMOozRqeXY+s7Ei2FHHnf3iX+IwU1JfbHTPao+LuLpreDF29ve2KNcB
 RqSEoJcu37h56mWScEbX4yvGdKjMGZrppw48oeC9NERA2OALK0SrGmcbISacwvhwEcFLUUc
 q3VembG4clUlcWq3adfoA==
UI-OutboundReport: notjunk:1;M01:P0:QRld5yA2exQ=;YciBQ+/6vI4FhBlsYcmC6AowMWH
 sVVpW48C+HXNVRVJSr5hbV9h6TkETGFp1o4+rQgv9n6iCfFT0DR4zK5Uzt5bo3fBuLlVyv/B2
 WExs7bpDiYK4hK2tgQOmamslW+F59rBVS77nTJQ4uvbMrSdBrRncQZnyrimWJxh9eFW4KxetT
 SpevudvkAsG7oBcaOyh85sb+ajIgt01x5uU2dzVfmhEREEJwDON4CDpoWw8maWYytcmEMSmWd
 ljgzJpg4jRFhpuFlEHo/pE+JPEeK7YDaReOBv6DA30pUigmqbxbPE8eIWSG4oXzwtF55gZWW+
 eTP/TJvWCuFiA1PqEsLm+A+qPimBX3wax5OIYteqKuC/niQ5u1SfXON/p78mIriFM1G1djH0u
 dJanhJv/TQSGGOI31lb2OyxMzRpcN3lW+G+v3ymKIy+7OYR8vbqwnDl9p7OqbVGpCCQ2qlBny
 7ZClNt8+knvgv4JbKEb8+EaxN0D/zP0eiL3bPq4Gi+uBmsuECcuho3WhpbZMv4iIL+jegDieI
 8WMP+bB8Tp8m7Z5ri6UaJWUCVvwsCmxoWok0qQhdSCOKMmYQ+h6qsXl88ipl0Pf0TzYLrBKZ3
 /XQGI9U3eSlOPfbEiR6RVXIYa8r+1OcDD0vJztg0hR3dpIxdYbD9nLfFnhugyjGcGYaYVrdcJ
 uLS19kAPOyvatnQxpa3u3iAbemyZCSxD5ZZkzZCI4J+OXLRX09C8mY6sl5amWoCzL6NUVWdT9
 VMiVZXpk2F/WaACqbrhdQQY9MLelL/wSn5UoAX5u0/YZbcdAu4tH3ZNhZk0gW6FzH2g9SDzrT
 6fZlrR/A10u1xd+iZ2ei7dWde+POKEyXD/M0Uadt0tbQkwrKF0wv6MweL4VpzXSwETfYNsk2B
 G8MrF9Cm/bsVycwN6NDNwIHClT0I1NWJ8G8CJa6YmaaJxUhxENUKMT5c+1AWILCiMRXpOwXZQ
 wrL6w2CrZ66kX9NeurfnS5kAtg6Xcy+HwVtU1ujd+ri9jMOsVnx7zP/nEaVIXs7Wg82jVnvko
 9rfD9yumwZzqur3X3SlPRRNav3DGARiIlcTfVuTTLks3MWHOl4VpsWmZE/J45TmRGfDp5s+mt
 oii0lpybZ5jicU7IJRiMbIWmGFuCL8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_161648_604250_7F6A990F 
X-CRM114-Status: GOOD (  10.00  )
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

The Raspberry Pi can suffer on interrupt storms on HCD resume. The dwc2
driver sometimes misses to enable HCD_FLAG_HW_ACCESSIBLE before re-enablin=
g
the interrupts. This causes a situation where both handler ignore a incomi=
ng
port interrupt and force the upper layers to disable the dwc2 interrupt
line. This leaves the USB interface in a unusable state:

irq 66: nobody cared (try booting with the "irqpoll" option)
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W          6.10.0-rc3
Hardware name: BCM2835
Call trace:
unwind_backtrace from show_stack+0x10/0x14
show_stack from dump_stack_lvl+0x50/0x64
dump_stack_lvl from __report_bad_irq+0x38/0xc0
__report_bad_irq from note_interrupt+0x2ac/0x2f4
note_interrupt from handle_irq_event+0x88/0x8c
handle_irq_event from handle_level_irq+0xb4/0x1ac
handle_level_irq from generic_handle_domain_irq+0x24/0x34
generic_handle_domain_irq from bcm2836_chained_handle_irq+0x24/0x28
bcm2836_chained_handle_irq from generic_handle_domain_irq+0x24/0x34
generic_handle_domain_irq from generic_handle_arch_irq+0x34/0x44
generic_handle_arch_irq from __irq_svc+0x88/0xb0
Exception stack(0xc1b01f20 to 0xc1b01f68)
1f20: 0005c0d4 00000001 00000000 00000000 c1b09780 c1d6b32c c1b04e54 c1a5e=
ae8
1f40: c1b04e90 00000000 00000000 00000000 c1d6a8a0 c1b01f70 c11d2da8 c11d4=
160
1f60: 60000013 ffffffff
__irq_svc from default_idle_call+0x1c/0xb0
default_idle_call from do_idle+0x21c/0x284
do_idle from cpu_startup_entry+0x28/0x2c
cpu_startup_entry from kernel_init+0x0/0x12c
handlers:
[<f539e0f4>] dwc2_handle_common_intr
[<75cd278b>] usb_hcd_irq
Disabling IRQ #66

So enable the HCD_FLAG_HW_ACCESSIBLE flag in case there is a port
connection.

Fixes: c74c26f6e398 ("usb: dwc2: Fix partial power down exiting by system =
resume")
Closes: https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703=
e1fd@gmx.net/T/
Link: https://lore.kernel.org/all/5e8cbce0-3260-2971-484f-fc73a3b2bd28@syn=
opsys.com/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index cb54390e7de4..26a320c1979a 100644
=2D-- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4431,6 +4431,7 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 	 * Power Down mode.
 	 */
 	if (hprt0 & HPRT0_CONNSTS) {
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 		hsotg->lx_state =3D DWC2_L0;
 		goto unlock;
 	}
=2D-
2.34.1


