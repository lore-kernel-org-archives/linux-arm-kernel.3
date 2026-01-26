Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C2AC88E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38F1GYV0XN/PxaeV/i4/kx4eQmWmLGFD/ba5srNlENw=; b=BKq8pYYHQHJF0jx/tFWaWrVd/A
	CpUBzpJ4kMhOewE0CmKCuMD6lQ4aPAxfiTQuiuP9E/CnP6gJmHNUVJ4ySuikX5c0+PRUV/8kIkJUk
	4R2x5CcS78lBrhwJ4stKwPr7CTGiYc1C3S9EV0cnALvzLZkjlHOS9f8N7rTPBMVNB5lcB4LHv0n/7
	EjInDj96xnF/+jnnc9MbOScqkIzAb/QS9aDD3JPnfk9uriIXbPZAfzoOz1CC4E+vxEdLry6dUV2Ox
	sBxA4DZSwawDYt7ItK8lmzO70YQjOLtoILndS8jPWTuTwr5iH+yvQEl3IXJUs+Ez+eeeXap38WA6j
	rKRWX3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIeg-0000000C9y9-1v9l;
	Mon, 26 Jan 2026 09:13:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIec-0000000C9wr-38Ig
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:13:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b884ad1026cso661585366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769418781; cv=none;
        d=google.com; s=arc-20240605;
        b=I7ZkcqLiYrLfAU9/gPPuajlddcc+Uuq6PVDQPsshQxDolhdoFq1sf2g9XElnt0ClbR
         e5cCquSDJRCGBpMDo3HSBMcjkGZ+UhkBB3anvwp/vJ1q6g9XH/NXRmq0fGnJMECtVtqw
         bbqbgYqE+Wx/XFmg067GGl9fybfV8GgiJGD/CMEX/a9sGenWV0FfqXmE29CrgNSdj2Xd
         3G2nmGMsUSK/oMzD2uo7LWlIIXvv7KtncVP5/Dv/orG1ub/9vl/JRRoNu3bLL3fn+w9V
         IrN6QkQY5f44U3paUj7U8suIXGMmDc0O+/21pBnAQD8C3GLt2iOTxeMdUh5LuuBDC9t9
         AaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38F1GYV0XN/PxaeV/i4/kx4eQmWmLGFD/ba5srNlENw=;
        fh=hakd+0G/p5s5CHArUouVMNwm5Q6+m9OHbIXLf+7WbWM=;
        b=Z7QRAhafipdd878D0QTyZql6accjwS5478SSC9RDeshfecQ1ZwSNHD/jU5Qw8MXFD3
         GabOFmtYVhSsd7F8C77vn7XrfYQe/5x+6qFKC+a0QYVHhiJM0PZQg7R2O34bSZ1Avd/2
         P2aOf+WXz1GbxlSTra/5a6zt4G/JfZNwZveiu/K70d+V/pjaZsUqYIvAvwGhxedPamZ5
         3kKve2HDE84HrnRqAsD0VST3ASrNmdLbLxwac4BzGEQIgfTSlxYVyu3alIt/80LXku+m
         pKDjuHGyantjOLzueTPoSRSbltYurDOci8qpsyaTgJkPxKT8xA7/SEb2mtHeAKwwSB5i
         zk1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1769418781; x=1770023581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38F1GYV0XN/PxaeV/i4/kx4eQmWmLGFD/ba5srNlENw=;
        b=U2IuzwMoDNnJdoXdTudmGSIM8wFho++iz5FkHgSqF6xH5wZMIN0EM7/gQkYb2PgNo/
         6DNK75Q4IZUz4GF2fa6ePr17XIl+R/Q1oJYabVp01hpcJGRi8fpQ/siTNXIm9Vutg6t0
         QtrEPQSXUp27ZopTLoP2C/MxoeCuGr6YQ44rUasxmu8VtfNUfIeVRsOOqMx04sYMfcsp
         AimJlQiz+AECYZrcFlqISrlJVUG5zyF+zDc46rp/Y7Hd5SexRAlZM2dKMThoIFXZmbcr
         1FoHfTgmZWEoV9aWGg28nfD7DsavlEoInsW4Cu/77uSA8IzMUf590VdRAQ2uBmrSBT7u
         NIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769418781; x=1770023581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38F1GYV0XN/PxaeV/i4/kx4eQmWmLGFD/ba5srNlENw=;
        b=lCnPl4iwEP7ZYERiWFZhX6uXDx9UBV9IH8UzpyZASwoDtR+aLCpt+hv7QmFQ/pntSF
         JXf+aztbzrj0+LxJ8MiCUxEYmCAjtLO4HZg3T0GO2Ph56X9chnFeHAoz8u4vztfhSU4p
         VuN6p0iINeaqVY2ts7tR1IybzzzW5p1nfJ9NseaNgILZTWcsZb8z+H4qhKfaKQiCMKH3
         NESG1FEkEUko8I5rk82vii5KwSTZ4S8JtFQDgj15hJHEPFAOj4/0qxcOAXm+WWAPUkD0
         fZxV4zkCL6kT2Owyiiky2o78X2MAiXZ7EmoZMStbvuW/olc/AL/PtYWP+XOmBalohxZ3
         yfzg==
X-Forwarded-Encrypted: i=1; AJvYcCXGCRNq0DrkWs9Tgwfy45F5XuL7vtLoaPetWyAzh6TX9acl3c4b0n75fOm7z3d2qoCMjV7jUyCvpYKhJ7/AaGUQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3tEvadzhNpGEuXTX+qP4OHysvWPXYUzA4sRI6UrxOqEqP+eoG
	Jht3NkI8IucKZA74MgUondudU+65J1JvlHzKkYw2vwOFyjPXtYBm/K/6DpdOYqpT04hHsbXYZR7
	jDx6KFTnLfIC/yHwnbhqqsrDwuZfKFETj3YHYygYyNQ==
X-Gm-Gg: AZuq6aIpJseyNsyVkc5j8AlQzezQDmncZiJUPX3M2R4SepuzpB5aoKY9KsweYMKH8RL
	F4rtf/cqcJKd0hLUPupguG93cmhr5zceo9DEuVZyFE8UXjkltiKxM3X45XyAM6nHSRL4MbhneCe
	W0D1J22O9QdBQv0ozvkktvUM3CUSLWNsr1h+E0fA2SXq73Wd6QsRIT+TNUE52uI6JIDKrpa1Rjk
	tfADTSyTpw4rbpVi+LmlO+Osk6wAJvhD6nPc9kiMNfMmXHGNKn3qJBn/zbJNsIgAhhzQkAq7qKR
	BNmRYYFY9EnWclO0ZwxhnkczneECVL1EUgiC66lrzfT+vcJUlg4=
X-Received: by 2002:a17:907:3cc6:b0:b87:e75:92e3 with SMTP id
 a640c23a62f3a-b8cfedfbb3cmr291271166b.4.1769418780434; Mon, 26 Jan 2026
 01:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <20250827-i2c-pxa-fix-i2c-communication-v3-2-052c9b1966a2@gmail.com>
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-2-052c9b1966a2@gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 26 Jan 2026 10:12:49 +0100
X-Gm-Features: AZwV_QjbdS2c5gKFf7G1ps0B7bA9mX_zUUwnEF3cB_N_luca8ANmVfGDdft_W_U
Message-ID: <CA+HBbNE9yKj6pnZZm3m_+vsUjOvMPtuQQJ2SjZ9XSgvBf0n0Kw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Hanna Hawa <hhhawa@amazon.com>, Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_011302_908770_BB4681A5 
X-CRM114-Status: GOOD (  47.25  )
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

On Wed, Aug 27, 2025 at 7:14=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:
>
> Under some circumstances I2C recovery fails on Armada 3700. At least
> on the Methode uDPU board, removing and replugging an SFP module fails
> often, like this:
>
>   [   36.953127] sfp sfp-eth1: module removed
>   [   38.468549] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>   [   38.486960] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    r=
ev 1.0  sn MNC208U90009     dc 200828
>   [   38.496867] mvneta d0040000.ethernet eth1: unsupported SFP module: n=
o common interface modes
>   [   38.521448] hwmon hwmon2: temp1_input not attached to any thermal zo=
ne
>   [   39.249196] sfp sfp-eth1: module removed
>   ...
>   [  292.568799] sfp sfp-eth1: please wait, module slow to respond
>   ...
>   [  625.208814] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>
> Note that the 'unsupported SFP module' messages are not relevant. The
> module is used only for testing the I2C recovery funcionality, because
> the error can be triggered easily with this specific one.
>
> Enabling debug in the i2c-pxa driver reveals the following:
>
>   [   82.034678] sfp sfp-eth1: module removed
>   [   90.008654] i2c i2c-1: slave_0x50 error: timeout with active message
>   [   90.015112] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>   [   90.020464] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 I=
SR: 00000802
>   [   90.027906] i2c i2c-1: log:
>   [   90.030787]
>
> This continues until the retries are exhausted ...
>
>   [  110.192489] i2c i2c-1: slave_0x50 error: exhausted retries
>   [  110.198012] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>   [  110.203323] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 I=
SR: 00000802
>   [  110.210810] i2c i2c-1: log:
>   [  110.213633]
>
> ... then the whole sequence starts again ...
>
>   [  115.368641] i2c i2c-1: slave_0x50 error: timeout with active message
>
> ... while finally the SFP core gives up:
>
>   [  671.975258] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>
> When we analyze the log, it can be seen that bit 1 and 11 is set in the
> ISR (Interface Status Register). Bit 1 indicates the ACK/NACK status, but
> the purpose of bit 11 is not documented in the driver code unfortunately.
>
> The 'Functional Specification' document of the Armada 3700 SoCs family
> however says that this bit indicates an 'Early Bus Busy' condition. The
> document also notes that whenever this bit is set, it is not possible to
> initiate a transaction on the I2C bus. The observed behaviour corresponds
> to this statement.
>
> Unfortunately, I2C recovery does not help as it never runs in this
> special case. Although the driver checks the busyness of the bus at
> several places, but since it does not consider the A3700 specific bit
> in these checks it can't determine the actual status of the bus correctly
> which results in the errors above.
>
> In order to fix the problem, add a new member to struct 'i2c_pxa' to
> store a controller specific bitmask containing the bits indicating the
> busy status, and use that in the code while checking the actual status
> of the bus. This ensures that the correct status can be determined on
> the Armada 3700 based devices without causing functional changes on
> devices based on other SoCs.
>
> With the change applied, the driver detects the busy condition, and runs
> the recovery process:
>
>   [  742.617312] i2c i2c-1: state:i2c_pxa_wait_bus_not_busy:449: ISR=3D00=
000802, ICR=3D000007e0, IBMR=3D03
>   [  742.626099] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>   [  742.631933] i2c i2c-1: recovery: resetting controller, ISR=3D0x00000=
802
>   [  742.638421] i2c i2c-1: recovery: IBMR 0x00000003 ISR 0x00000000
>
> This clears the EBB bit in the ISR register, so it makes it possible to
> initiate transactions on the I2C bus again.
>
> After this patch, the SFP module used for testing can be removed and
> replugged numerous times without causing the error described at the
> beginning. Previously, the error happened after a few such attempts.
>
> The patch has been tested also with the following kernel versions:
> 5.10.240, 5.15.189, 6.1.148, 6.6.102, 6.12.42, 6.14.11, 6.15.10, 6.16.1
> It improves recovery on all of them.
>
> Cc: stable@vger.kernel.org # 5.10+
> Reviewed-by: Imre Kaloz <kaloz@openwrt.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Tested-by: Robert Marko <robert.marko@sartura.hr>

> Changes in v3:
>   - rebase on tip of i2c/for-current
>   - use Reviewed-by tag for Imre
>   - remove Fixes tag as the problem is not caused by the previously menti=
oned
>     commit, simply it is not handled by the code yet
>   - update list of tested kernels
>   - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-commun=
ication-v2-3-ca42ea818dc9@gmail.com
>
> Changes in v2:
>   - rebase and retest on tip of i2c/for-current
>   - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-commun=
ication-v1-3-e9097d09a015@gmail.com
> ---
>  drivers/i2c/busses/i2c-pxa.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 70acf33e1d573231f84a1f09cffb376a8277351d..19f5da08def11ded1d3de968f=
50fa5b5851066f5 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -71,6 +71,7 @@
>  #define ISR_GCAD       (1 << 8)           /* general call address detect=
ed */
>  #define ISR_SAD                (1 << 9)           /* slave address detec=
ted */
>  #define ISR_BED                (1 << 10)          /* bus error no ACK/NA=
K */
> +#define ISR_A3700_EBB  (1 << 11)          /* early bus busy for armada 3=
700 */
>
>  #define ILCR_SLV_SHIFT         0
>  #define ILCR_SLV_MASK          (0x1FF << ILCR_SLV_SHIFT)
> @@ -263,6 +264,7 @@ struct pxa_i2c {
>         bool                    highmode_enter;
>         u32                     fm_mask;
>         u32                     hs_mask;
> +       u32                     busy_mask;
>
>         struct i2c_bus_recovery_info recovery;
>         struct pinctrl          *pinctrl;
> @@ -430,7 +432,7 @@ static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *=
i2c)
>
>         while (1) {
>                 isr =3D readl(_ISR(i2c));
> -               if (!(isr & (ISR_IBB | ISR_UB)))
> +               if (!(isr & i2c->busy_mask))
>                         return 0;
>
>                 if (isr & ISR_SAD)
> @@ -467,7 +469,7 @@ static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
>                  * quick check of the i2c lines themselves to ensure they=
've
>                  * gone high...
>                  */
> -               if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) =3D=3D 0 &&
> +               if ((readl(_ISR(i2c)) & i2c->busy_mask) =3D=3D 0 &&
>                     readl(_IBMR(i2c)) =3D=3D (IBMR_SCLS | IBMR_SDAS)) {
>                         if (i2c_debug > 0)
>                                 dev_dbg(&i2c->adap.dev, "%s: done\n", __f=
unc__);
> @@ -488,7 +490,7 @@ static int i2c_pxa_set_master(struct pxa_i2c *i2c)
>         if (i2c_debug)
>                 dev_dbg(&i2c->adap.dev, "setting to bus master\n");
>
> -       if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) !=3D 0) {
> +       if ((readl(_ISR(i2c)) & i2c->busy_mask) !=3D 0) {
>                 dev_dbg(&i2c->adap.dev, "%s: unit is busy\n", __func__);
>                 if (!i2c_pxa_wait_master(i2c)) {
>                         dev_dbg(&i2c->adap.dev, "%s: error: unit busy\n",=
 __func__);
> @@ -514,7 +516,7 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
>                         dev_dbg(&i2c->adap.dev, "%s: %ld: ISR=3D%08x, ICR=
=3D%08x, IBMR=3D%02x\n",
>                                 __func__, (long)jiffies, readl(_ISR(i2c))=
, readl(_ICR(i2c)), readl(_IBMR(i2c)));
>
> -               if ((readl(_ISR(i2c)) & (ISR_UB|ISR_IBB)) =3D=3D 0 ||
> +               if ((readl(_ISR(i2c)) & i2c->busy_mask) =3D=3D 0 ||
>                     (readl(_ISR(i2c)) & ISR_SAD) !=3D 0 ||
>                     (readl(_ICR(i2c)) & ICR_SCLE) =3D=3D 0) {
>                         if (i2c_debug > 1)
> @@ -1177,7 +1179,7 @@ static int i2c_pxa_pio_set_master(struct pxa_i2c *i=
2c)
>         /*
>          * Wait for the bus to become free.
>          */
> -       while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB))
> +       while (timeout-- && readl(_ISR(i2c)) & i2c->busy_mask)
>                 udelay(1000);
>
>         if (timeout < 0) {
> @@ -1322,7 +1324,7 @@ static void i2c_pxa_unprepare_recovery(struct i2c_a=
dapter *adap)
>          * handing control of the bus back to avoid the bus changing stat=
e.
>          */
>         isr =3D readl(_ISR(i2c));
> -       if (isr & (ISR_UB | ISR_IBB)) {
> +       if (isr & i2c->busy_mask) {
>                 dev_dbg(&i2c->adap.dev,
>                         "recovery: resetting controller, ISR=3D0x%08x\n",=
 isr);
>                 i2c_pxa_do_reset(i2c);
> @@ -1479,6 +1481,10 @@ static int i2c_pxa_probe(struct platform_device *d=
ev)
>         i2c->fm_mask =3D pxa_reg_layout[i2c_type].fm;
>         i2c->hs_mask =3D pxa_reg_layout[i2c_type].hs;
>
> +       i2c->busy_mask =3D ISR_UB | ISR_IBB;
> +       if (i2c_type =3D=3D REGS_A3700)
> +               i2c->busy_mask |=3D ISR_A3700_EBB;
> +
>         if (i2c_type !=3D REGS_CE4100)
>                 i2c->reg_isar =3D i2c->reg_base + pxa_reg_layout[i2c_type=
].isar;
>
>
> --
> 2.50.1
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

